"use strict";
/**
 * ## Anchors
 * Define and track poses in world space.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserAnchor = exports.Anchor = exports.State = void 0;
const Event_1 = require("./Util/Event");
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
var State;
(function (State) {
    /**
     * The anchor is known to exist but no details or tracking is available yet.
     */
    State[State["Initializing"] = 0] = "Initializing";
    /**
     * Any offline information is now present.
     */
    State[State["Ready"] = 1] = "Ready";
    /**
     * We expect to be able to track without the user having to physically move.
     */
    State[State["CanTrack"] = 2] = "CanTrack";
    /**
     * We are now tracking to an anchor defined accuracy.
     */
    State[State["Found"] = 3] = "Found";
    /**
     * We are not or no longer tracking to the anchor defined accuracy.
     */
    State[State["Lost"] = 4] = "Lost";
    /**
     * The user will have to move.
     */
    State[State["CannotTrack"] = 5] = "CannotTrack";
    /**
     * An irretrievable error has occurred.
     */
    State[State["Error"] = 6] = "Error";
})(State || (exports.State = State = {}));
/**
 * Base class for all anchors.
 */
class Anchor {
    constructor(id) {
        /**
         * State is changing from <State> to <State>.
         */
        this.onStateChangeEvent = new Event_1.default();
        this.onStateChange = this.onStateChangeEvent.publicApi();
        /**
         * All offline information needed for onFound has loaded.
         */
        this.onReadyEvent = new Event_1.default();
        this.onReady = this.onReadyEvent.publicApi();
        /**
         * An irretrievable error has occurred and anchor will be unusable, possibly permanently.
         */
        this.onErrorEvent = new Event_1.default();
        this.onError = this.onErrorEvent.publicApi();
        /**
         * The anchor has been located in current world space.
         */
        this.onFoundEvent = new Event_1.default();
        this.onFound = this.onFoundEvent.publicApi();
        /**
         * The anchor has been located in current world space
         */
        this.onLostEvent = new Event_1.default();
        this.onLost = this.onLostEvent.publicApi();
        this.id = id;
        this._state = State.Initializing;
    }
    /**
     * World pose of anchor when state == found, undefined otherwise
     */
    get toWorldFromAnchor() {
        return undefined;
    }
    /**
     * Set world pose of anchor
     * it is an error to set this property if the anchor is not user created.
     */
    set toWorldFromAnchor(toWorldFromAnchor) {
        throw new Error("Anchor is immutable.");
    }
    /**
     * Current state of the anchor.
     */
    get state() {
        return this._state;
    }
    set state(newState) {
        if (this._state === newState) {
            return;
        }
        this._validateTransition(newState);
        this._transitionThroughIntermediateStatesTo(newState);
    }
    // these functions implement the state transition invariants.
    // please see the state diagram above for the allowed transitions.
    _validateTransition(newState) {
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
            throw new Error("Invalid state transition from " + this._state + " to " + newState);
        }
    }
    _transitionTo(newState) {
        // raw transitions - ignoring validation and intermediate states
        this.onStateChangeEvent.invoke([this._state, newState]);
        this._state = newState;
    }
    _transitionThroughIntermediateStatesTo(newState) {
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
                }
                else if (this._state == State.Found) {
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
                }
                else if (this._state == State.Ready) {
                    this._transitionTo(State.CanTrack);
                }
                this._transitionTo(newState);
                if (newState == State.Found) {
                    this.onFoundEvent.invoke();
                }
                else {
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
exports.Anchor = Anchor;
/**
 * Base class for user created and modifiable anchors.
 */
class UserAnchor extends Anchor {
}
exports.UserAnchor = UserAnchor;
//# sourceMappingURL=Anchor.js.map