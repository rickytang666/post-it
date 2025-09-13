/**
 * ## Anchors
 * Define and track poses in world space.
 */

import Event, { PublicApi } from "./Util/Event";
import {
  SpatialPersistence,
  AnchorEvent,
  AnchorError,
} from "./SpatialPersistence/SpatialPersistence";
import { Anchor, State, UserAnchor } from "./Anchor";
import { WorldAnchor } from "./WorldAnchor";
import { AlignmentProvider } from "./AlignmentProvider";
import { setTimeout } from "./Util/debounce";
import { LoggerVisualization } from "./SpatialPersistence/Logging";

/**
 * Types of anchors that will be tracked in a session, specifically
 * those for which known instances will be automatically enumerated
 */
export type SessionAnchorTypes = typeof WorldAnchor | typeof UserAnchor;

/**
 * Options for locating and persisting nearby anchors, past and new.
 */
export class AnchorSessionOptions {
  /**
   * Named scope for storing and retrieving anchors.
   * A13 - only one may be active at a time.
   */
  area: string = "default";

  /**
   * Anchor types to look for.
   * Default to at least searching for WorldAnchors.
   */
  scanForWorldAnchors: boolean = false;
}

/**
 * Storage context for anchors.
 */
export class AnchorSession {
  /**
   * Named scope for storing and retrieving anchors.
   */
  readonly area: string;

  /**
   * Notifies of anchors becoming available within area scope.
   */
  private onAnchorNearbyEvent = new Event<Anchor>();
  public readonly onAnchorNearby = this.onAnchorNearbyEvent.publicApi();

  private onAnchorDeletedEvent = new Event<UserAnchor>();
  public readonly onAnchorDeleted = this.onAnchorDeletedEvent.publicApi();

  /**
   * Internal hook to defer an operation to the next frame.
   * For override in tests.
   */
  public static theDeferToNextFrame: (callback: () => void) => void = (
    callback,
  ): void => {
    setTimeout(callback, 0);
  };

  private _notifiesOnNearbyWorldAnchors: boolean = false;
  private _loadedAnchors: Map<string, UserAnchor> = new Map<string, Anchor>();

  private _spatialPersistence: SpatialPersistence;
  private _onClose: (store: AnchorSession) => Promise<void>;
  private _anchorCount: number = 0;
  private _waitingForArea: (() => void)[] = [];
  private _areaSelected: Promise<void> = new Promise<void>((resolve) => {
    this._waitingForArea.push(resolve);
  });
  private _registrationUnsubscribes: (() => void)[] = [];
  private _isResetting: boolean = false;
  private _isClosing: boolean = false;

  constructor(
    options: AnchorSessionOptions,
    spatialPersistence: SpatialPersistence,
    onClose: (store: AnchorSession) => Promise<void>,
  ) {
    this.area = options.area;
    this._isResetting = false;
    this._isClosing = false;
    this._onClose = onClose;
    this._notifiesOnNearbyWorldAnchors = options.scanForWorldAnchors;
    this._spatialPersistence = spatialPersistence;
    this._registrationUnsubscribes.push(
      this._spatialPersistence.onLoaded.add(this._onLoaded.bind(this)),
    );
    this._registrationUnsubscribes.push(
      this._spatialPersistence.onLoadError.add(this._onLoadError.bind(this)),
    );

    this._registrationUnsubscribes.push(
      this._spatialPersistence.onFound.add(this._onFound.bind(this)),
    );
    this._registrationUnsubscribes.push(
      this._spatialPersistence.onLost.add(this._onLost.bind(this)),
    );
    this._registrationUnsubscribes.push(
      this._spatialPersistence.onUnloaded.add(this._onUnloaded.bind(this)),
    );
    this._registrationUnsubscribes.push(
      this._spatialPersistence.onDeleted.add(this._onDeleted.bind(this)),
    );

    // finish construction and give receivers a chance to subscribe to activation events before selecting area
    AnchorSession.theDeferToNextFrame(() => {
      this._spatialPersistence.selectArea(this.area);
      while (this._waitingForArea.length > 0) {
        let next = this._waitingForArea.shift()!;
        next();
      }
      this._areaSelected = Promise.resolve();
    });
  }

  /**
   * Stop trying to find or track anchors in the area.
   */
  async close(): Promise<void> {
    await this._areaSelected;
    this._isClosing = true;
    await this._onClose(this);
    this._registrationUnsubscribes.forEach((unsubscribe) => {
      unsubscribe();
    });
    this._registrationUnsubscribes = [];
  }

  /**
   * Save an anchor in storage after user modifications.
   */
  async saveAnchor(anchor: UserAnchor): Promise<UserAnchor> {
    this._checkIsNotClosing();
    await this._areaSelected;

    if (!(anchor instanceof WorldAnchor)) {
      throw new Error("Only WorldAnchors supported");
    }

    // This can throw if the anchor is deleted while waiting for save to complete
    let anchorEvent = await this._spatialPersistence.saveAnchor(
      (anchor as WorldAnchor)._sceneObject,
    );

    this._loadedAnchors.set(anchor.id, anchor);

    return anchor;
  }

  /**
   * Delete anchor from the storage context.
   */
  async deleteAnchor(anchor: UserAnchor): Promise<UserAnchor> {
    this._checkIsNotClosing();
    await this._areaSelected;

    if (!(anchor instanceof WorldAnchor)) {
      throw new Error("Only WorldAnchors supported");
    }

    let anchorEvent = await this._spatialPersistence.deleteAnchor(
      (anchor as WorldAnchor)._sceneObject,
    );

    return anchor;
  }

  /**
   * Delete all anchors and reset ability to track in current area.
   */
  async reset(): Promise<void> {
    this._checkIsNotClosing();
    if (this._isResetting) {
      this.log("AnchorSession: reset already in progress");
      return;
    }
    this._isResetting = true;
    try {
      await this._areaSelected;
      await this._spatialPersistence.resetArea();
      this._loadedAnchors = new Map<string, Anchor>();
    } finally {
      this._isResetting = false;
    }
  }

  /**
   * Create a world anchor.
   *
   * @param toWorldFromAnchor - World pose of anchor. 'World' is the coordinate system of scene graph root, compatible with a child rendering camera positioned by DeviceTracking set to world.
   */
  async createWorldAnchor(
    toWorldFromAnchor: mat4,
    alignment?: AlignmentProvider,
  ): Promise<WorldAnchor> {
    this._checkIsNotClosing();
    await this._areaSelected;

    let anchorSceneObject: SceneObject = global.scene.createSceneObject(
      "_anchor_" + this._anchorCount++,
    );
    anchorSceneObject.getTransform().setWorldTransform(toWorldFromAnchor);

    try {
      let anchorEvent =
        this._spatialPersistence.createAnchor(anchorSceneObject);

      let anchor = new WorldAnchor(
        anchorEvent.location,
        anchorSceneObject,
        alignment,
      );

      // having waited on this._spatialPersistence.createAnchor
      // anchor on creation is found, with nothing watching on handlers yet
      // via anchor resolved from AnchorSession.createWorldAnchor
      anchor.state = State.Found;

      return anchor;
    } catch (error) {
      throw new Error("Failed to create anchor: " + error);
    }
  }

  // implementation details
  private _checkIsNotClosing() {
    if (this._isClosing === true) {
      throw new Error("Session is closing");
    }
  }

  private async _onLoaded(event: AnchorEvent) {
    await this._areaSelected;
    // todo (gbakker) - need to support alignment serialization
    let anchor = new WorldAnchor(event.location, event.sceneObject);
    this._loadedAnchors.set(event.location.getProxyId(), anchor);
    // todo (gbakker) - as specced atm anchor will be ready to track, we should verify this
    anchor.state = State.Ready;
    if (this._notifiesOnNearbyWorldAnchors) {
      this.onAnchorNearbyEvent.invoke(anchor);
    }
  }

  private async _onLoadError(event: AnchorError) {
    await this._areaSelected;
    // it doesn't exist yet and never will o_O
    // todo (gbakker) - need to support alignment serialization
    let anchor = new WorldAnchor(event.location);
    this._loadedAnchors.set(event.location.getProxyId(), anchor);
    anchor.state = State.Error;

    if (this._notifiesOnNearbyWorldAnchors) {
      this.onAnchorNearbyEvent.invoke(anchor);
    }
  }

  private async _onUnloaded(event: AnchorEvent) {
    await this._areaSelected;
    const anchor = this._loadedAnchors.get(event.location.getProxyId());
    if (anchor) {
      anchor.state = State.CannotTrack;
    } else {
      this.log(
        "AnchorSession: _onUnloaded - anchor not found in loaded anchors",
      );
    }
  }

  private async _onFound(event: AnchorEvent) {
    await this._areaSelected;
    const anchor = this._loadedAnchors.get(event.location.getProxyId());
    if (anchor) {
      anchor.state = State.Found;
    } else {
      this.log("AnchorSession: _onFound - anchor not found in loaded anchors");
    }
  }

  private async _onLost(event: AnchorEvent) {
    await this._areaSelected;
    const anchor = this._loadedAnchors.get(event.location.getProxyId());
    if (anchor) {
      anchor.state = State.Lost;
    } else {
      this.log("AnchorSession: _onLost - anchor not found in loaded anchors");
    }
  }

  private async _onDeleted(event: AnchorEvent) {
    await this._areaSelected;
    let anchor = this._loadedAnchors.get(event.location.getProxyId());
    if (anchor) {
      this.onAnchorDeletedEvent.invoke(anchor);
    } else {
      this.log(
        "AnchorSession: _onDeleted - anchor not found in loaded anchors",
      );
    }
  }

  private logger = LoggerVisualization.createLogger("persistence");
  private log = this.logger.log.bind(this.logger);
}
