// -----JS CODE-----

// Directions:

// Add as script component to a scene object
// Recommended settings are
// 200m Max Raycast Distance
// 100 Max List Size of Callbacks
// 10ms Max Processing Time Per Frame

// Create Camera with Device Tracking Component
// Create World Mesh and Depth Texture Resources
// Add World Mesh to your scene
// Connect the Device Tracking Component, Depth Texture Resource, and prefab to script
// Make sure to align your prefab facing direction along -z axis for easy rotation setting from camera direction

// @input SceneObject camera
// @input Asset.Texture depthTexture
// @input number raycastDistMaxM {"label":"Max Raycast Distance (m)", "min":10, "max":400, "step":10}
// @input number callbackListMax {"label":"Max List Size of Callbacks", "min":10, "max":200, "step":10}
// @input number frameProcessingMax {"label":"Max Processing Time Per Frame (ms)", "min":1, "max":20, "step":1}

var deviceTracking = null;
var cameraComponent = null;
var cameraTransform = null;
var raycastDistMaxCm = 0;
var callbackListFront = null;
var callbackListBack = null;
var callbackListMax = 0;
var callbackListCur = 0;
var frameProcessingMax = 0;
var currentNode = null;
script.isWorldRaycaster = true;
script.type = "WorldRaycaster";
script.getRaycastDistMaxCm = function() { 
    return raycastDistMaxCm; 
}
script.getCallbackListMax = function() { 
    return callbackListMax; 
}
script.getFrameProcessingMax = function() { 
    return frameProcessingMax; 
}

script.createEvent('OnStartEvent').bind(() => {
    if (!script.camera) {
        print("ERROR: Please set the camera to the script.");
        return;
    }
    deviceTracking = script.camera.getComponent("Component.DeviceTracking");
    cameraComponent = script.camera.getComponent("Component.Camera");
    cameraTransform = script.camera.getTransform();
    
    if (!script.depthTexture) {
        print("ERROR: Please set the depth texture to the script.");
        return;
    }
    depthTexture = script.depthTexture;
    
    raycastDistMaxCm = script.raycastDistMaxM * 100; //m to cm conversion
    callbackListMax = script.callbackListMax;
    frameProcessingMax = script.frameProcessingMax;
});

script.createEvent("UpdateEvent").bind(() => {
    if(callbackListFront === null) return;
    var isDone = false;
    var startTime = new Date();
    var processedNodes = 0;
    while (!isDone) {
        processCallbackNode();
        processedNodes++;
        if(callbackListFront === null) isDone = true; //list is now empty
        if(processedNodes >= callbackListCur) isDone = true; //went through list once
        var currTime = new Date();
        if (currTime - startTime > frameProcessingMax) {
            isDone = true;
        }
    }
});

script.hitTest = function(screenPos, shouldUpdateResult) {
    var hitTestResult = deviceTracking.hitTestWorldMesh(screenPos);
    var result = {
        hits: [],
        worldMesh: false,
        eventHandler: null
    }

    if(hitTestResult.length > 0) {
        result.hits = hitTestResult;
        result.worldMesh = true;
    } else {
        if (depthTexture.getWidth() < 10) {
            print("Instant World Hit Test: Depth Texture isn't ready yet");            
            return result;
        }
        var distance = 1;
        
        //clamp the extra touch points to ensure they are in valid screen space
        var touchPoints = [
            screenPos,
            new vec2(clamp(screenPos.x - distance/depthTexture.getWidth(),0,1), screenPos.y),
            new vec2(screenPos.x, clamp(screenPos.y - distance/depthTexture.getHeight(),0,1)),
            new vec2(clamp(screenPos.x + distance/depthTexture.getWidth(),0,1), screenPos.y),
            new vec2(screenPos.x, clamp(screenPos.y + distance/depthTexture.getHeight(),0,1))
        ];
        
        var worldPoints = [];
        touchPoints.forEach((touchPoint) => {
            //Extra check for valid screen space, should never need this
            if (touchPoint.x >= 0 && touchPoint.x <= 1 && touchPoint.y >= 0 && touchPoint.y <= 1) {
                var depthPoint = depthTexture.control.sampleDepthAtPoint(touchPoint);
                worldPoints.push(cameraComponent.screenSpaceToWorldSpace(touchPoint, depthPoint));
            } else {
                print ("Instant World Mesh Test: Touch point is out of screen bounds")
                return result;
            }
        });

        var normal = vec3.zero();
		if (worldPoints.length === 0) {
			print("Instant World Mesh Test: Empty set of world points"); 
			return result;
		} else if(worldPoints.length < 5) {
			print("Instant World Mesh Test: Not complete set of world points, giving default normal");
			normal = vec3.up();
			classification = TrackedMeshFaceClassification.Floor;
		} else {
            var normal = worldPoints[3].sub(worldPoints[1]).cross(worldPoints[2].sub(worldPoints[4]));
            normal.normalize();
            
            //on LiDAR devices, might get perfect normals resulting in empty cross product
			if(normal.length < 0.1) {
				print("Instant World Mesh Test: No normal from cross, probably on LiDAR, giving default normal");
				normal = vec3.up();
			}
            
            var classification = TrackedMeshFaceClassification.None;
            var dotY = vec3.up().dot(normal);
            if(dotY > 0.7) classification = TrackedMeshFaceClassification.Floor;
            else if(dotY < -0.7) classification = TrackedMeshFaceClassification.Ceiling;
            else if(Math.abs(dotY) < 0.15) classification = TrackedMeshFaceClassification.Wall;
            //print(dotY + " " + classification)
        }
        result.hits.push({
            normal:normal,
            position: worldPoints[0],
            classification: classification
        });
        if(shouldUpdateResult) {
            var hitTestEvent = makeEventForHitTestUpgrade({
                position: result.hits[0].position,
                normal: result.hits[0].normal,
            });
            hitTestEvent.handler.on(shouldUpdateResult);
            result.eventHandler = hitTestEvent.handler;
            var adjustedFromDepth = depthTexture.control.sampleDepthAtPoint(touchPoints[0])*3/4;
            var node = {
                hitTestEvent: hitTestEvent,
                from: cameraComponent.screenSpaceToWorldSpace(screenPos, adjustedFromDepth),
                to: cameraComponent.screenSpaceToWorldSpace(screenPos, raycastDistMaxCm),
                previous: null,
                next: null
            }
            if(callbackListCur < callbackListMax) {
                if(callbackListFront === null) {
                    callbackListFront = node;
                    callbackListBack = node;
                    callbackListFront.next = null;
                    callbackListFront.previous = null;
                    callbackListBack.next = null;
                    callbackListBack.previous = null;
                } else {
                    callbackListBack.next = node;
                    node.previous = callbackListBack;
                    callbackListBack = node;
                }
                callbackListCur++;
            } else {
                callbackListFront = callbackListFront.next;
                callbackListFront.previous.next = null;
                callbackListFront.previous = null;
                
                callbackListBack.next = node;
                node.previous = callbackListBack;
                callbackListBack = node;                
            }
        }
    }
    return result;
}

function processCallbackNode() {
    if(callbackListFront === null) return;
    if(currentNode === null) currentNode = callbackListFront;
    if(!currentNode.hitTestEvent.active()) {
        removeCurrentNodeFromList();
        return;
    }
    var hitTestResult = deviceTracking.raycastWorldMesh(currentNode.from, currentNode.to); 
    if(hitTestResult.length > 0) {
        currentNode.hitTestEvent.set({
            hits: hitTestResult,
            worldMesh: true
        });
        removeCurrentNodeFromList();
    } else {
        currentNode = currentNode.next;
    }
}

function removeCurrentNodeFromList() {
    if(currentNode === callbackListFront) {
        if(currentNode.next) currentNode.next.previous = null;
        callbackListFront = currentNode.next;
        currentNode.next = null;
        if(callbackListBack === currentNode) callbackListBack = callbackListFront;
        currentNode = callbackListFront;
    } else if(currentNode === callbackListBack) {
        callbackListBack = currentNode.previous;
        currentNode.previous = null;
        callbackListBack.next = null;
        currentNode = null;
    } else {
        var temp = currentNode.next;
        currentNode.previous.next = currentNode.next;
        currentNode.next.previous = currentNode.previous;
        currentNode.previous = null;
        currentNode.next = null;
        currentNode = temp;
    }
    callbackListCur--;
}

function makeEventForHitTestUpgrade(initialValue) {
    var value = initialValue;
    var fns = [];

    var on = function (fn) {
        if (typeof fn === "function") {
            fns.push(fn);
        }
    }
    var off = function (fn) {
        var index = fns.indexOf(fn);
        if (index !== -1) {
            fns.splice(index, 1);
        }
    }

    return {
        get: function () {
            return value;
        },
        set: function (v) {
            value = v;
            fns.forEach(function (fn) { fn(value) });
        },
        active: function() {
            if(fns.length > 0) return true;
            else return false;
        },
        handler: {
            on: on,
            off: off
        } 
    };
}

//Helper Functions
var clamp = function (_value, _min, _max) {
  return _value < _min ? _min : _value > _max ? _max : _value;
};
