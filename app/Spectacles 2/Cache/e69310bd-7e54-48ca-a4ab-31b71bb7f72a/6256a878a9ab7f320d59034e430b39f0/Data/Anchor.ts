/**
 * ## Anchors
 * Define and track poses in world space.
 */

import Event, { PublicApi } from "./Util/Event";

/**
 * Tracking state of an anchor.
 *
 * ```
 *                              +--------------+
 *                              | Initializing |
 *                              +--------------+
 *                                      |
 *                     +----------------+--------------------------------+
 *                     v                                                 v
 * +------------------------------------------------------------+   +---------+
 * |   Ready                                                    |   |  Error  |
 * |                                                            |   |         |
 * |   +----------------------------+       +---------------+   |   |         |
 * |   |   CanTrack                 |  <->  |  CannotTrack  |   |   |         |
 * |   |                            |       |               |   |   |         |
 * |   |   +-------+     +------+   |       |               |   |   |         |
 * |   |   | Found | <-> | Lost |   |       |               |   |   |         |
 * |   |   +-------+     +------+   |       |               |   |   |         |
 * |   |                            |       |               |   |   |         |
 * |   +----------------------------+       +---------------+   |   |         |
 * +------------------------------------------------------------+   +---------+
 * ```
 */
export enum State {
  /**
   * The anchor is known to exist but no details or tracking is available yet.
   */
  Initializing,
  /**
   * Any offline information is now present.
   */
  Ready,
  /**
   * We expect to be able to track without the user having to physically move.
   */
  CanTrack,
  /**
   * We are now tracking to an anchor defined accuracy.
   */
  Found,
  /**
   * We are not or no longer tracking to the anchor defined accuracy.
   */
  Lost,
  /**
   * The user will have to move.
   */
  CannotTrack,
  /**
   * An irretrievable error has occurred.
   */
  Error,
}

/**
 * Base class for all anchors.
 */
export abstract class Anchor {
  /**
   * Unique identifier for the anchor, for associating other information with it externally.
   */
  readonly id: string;

  /**
   * State is changing from <State> to <State>.
   */
  private onStateChangeEvent = new Event<[State, State]>();
  public readonly onStateChange = this.onStateChangeEvent.publicApi();

  /**
   * All offline information needed for onFound has loaded.
   */
  private onReadyEvent = new Event();
  public readonly onReady = this.onReadyEvent.publicApi();
  /**
   * An irretrievable error has occurred and anchor will be unusable, possibly permanently.
   */
  private onErrorEvent = new Event<Error>();
  public readonly onError = this.onErrorEvent.publicApi();
  /**
   * The anchor has been located in current world space.
   */
  private onFoundEvent = new Event();
  public readonly onFound = this.onFoundEvent.publicApi();
  /**
   * The anchor has been located in current world space
   */
  private onLostEvent = new Event();
  public readonly onLost = this.onLostEvent.publicApi();

  private _state: State;

  constructor(id: string) {
    this.id = id;
    this._state = State.Initializing;
  }

  /**
   * World pose of anchor when state == found, undefined otherwise
   */
  get toWorldFromAnchor(): mat4 | undefined {
    return undefined;
  }
  /**
   * Set world pose of anchor
   * it is an error to set this property if the anchor is not user created.
   */
  set toWorldFromAnchor(toWorldFromAnchor: mat4) {
    throw new Error("Anchor is immutable.");
  }
  /**
   * Current state of the anchor.
   */
  get state(): State {
    return this._state;
  }
  set state(newState: State) {
    if (this._state === newState) {
      return;
    }
    this._validateTransition(newState);
    this._transitionThroughIntermediateStatesTo(newState);
  }

  // these functions implement the state transition invariants.
  // please see the state diagram above for the allowed transitions.
  private _validateTransition(newState: State) {
    let valid = {
      [State.Initializing]: [
        State.Ready,
        State.CanTrack,
        State.Found,
        State.Lost,
        State.CannotTrack,
        State.Error,
      ],
      [State.Ready]: [
        State.CanTrack,
        State.Found,
        State.Lost,
        State.CannotTrack,
      ],
      [State.CanTrack]: [State.Found, State.Lost, State.CannotTrack],
      [State.Found]: [State.Lost, State.CannotTrack],
      [State.Lost]: [State.Found, State.CannotTrack],
      [State.CannotTrack]: [State.CanTrack, State.Found, State.Lost],
      [State.Error]: [],
    }[this._state];

    if (!valid.includes(newState)) {
      throw new Error(
        "Invalid state transition from " + this._state + " to " + newState,
      );
    }
  }
  private _transitionTo(newState: State) {
    // raw transitions - ignoring validation and intermediate states
    this.onStateChangeEvent.invoke([this._state, newState]);
    this._state = newState;
  }
  private _transitionThroughIntermediateStatesTo(newState: State) {
    // validation must already have been done
    // this function will transition through intermediate states and invoke events
    // associated with them. It will also transition to the final state and invoke
    // the event associated with it.
    switch (newState) {
      case State.Initializing: // won't happen
        break;
      case State.Ready: // happens directly
        this._transitionTo(State.Ready);
        this.onReadyEvent.invoke();
        break;
      case State.CanTrack:
      case State.CannotTrack:
        if (this._state == State.Initializing) {
          this._transitionTo(State.Ready);
          this.onReadyEvent.invoke();
        } else if (this._state == State.Found) {
          this._transitionTo(State.Lost);
          this.onLostEvent.invoke();
        }
        this._transitionTo(newState);
        break;
      case State.Found:
      case State.Lost:
        if (this._state == State.Initializing) {
          this._transitionTo(State.Ready);
          this.onReadyEvent.invoke();
          this._transitionTo(State.CanTrack);
        } else if (this._state == State.Ready) {
          this._transitionTo(State.CanTrack);
        }
        this._transitionTo(newState);
        if (newState == State.Found) {
          this.onFoundEvent.invoke();
        } else {
          this.onLostEvent.invoke();
        }
        break;
      case State.Error:
        this._transitionTo(State.Error);
        this.onErrorEvent.invoke(new Error("An error occurred"));
        break;
    }
  }
}

/**
 * Base class for user created and modifiable anchors.
 */
export abstract class UserAnchor extends Anchor {}
