"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PersistentStorage = void 0;
const Logging_1 = require("./Logging");
class IStorage {
    constructor() {
        this.logger = Logging_1.LoggerVisualization.createLogger("persistence");
        this.log = this.logger.log.bind(this.logger);
    }
}
IStorage.LocationModelStateKeyName = "locationModelState";
class RemoteStorage extends IStorage {
    constructor(locationCloudStorageModule) {
        super();
        this.waitingForLocationStore = [];
        this.writeOptions = RemoteStorage.makeCloudStorageWriteOptions();
        this.readOptions = RemoteStorage.makeCloudStorageReadOptions();
        this.locationCloudStorageModule = locationCloudStorageModule;
        this.connectToLocationCloudStore();
    }
    connectToLocationCloudStore() {
        let location = LocationAsset.getProxy("global");
        let options = LocationCloudStorageOptions.create();
        options.location = location;
        options.onDiscoveredNearby.add((_, cloudStore) => {
            this.locationCloudStore = cloudStore;
            this.flushLocationStorageActions();
        });
        options.onError.add((err, message) => {
            let errorMessage = "CloudStorageModule: failed to get location store: " + err + message;
            this.errorInCloudStore = errorMessage;
            this.flushLocationStorageActions();
            this.log(errorMessage);
        });
        this.locationCloudStorageModule.getNearbyLocationStores(options);
    }
    static makeCloudStorageWriteOptions() {
        let options = CloudStorageWriteOptions.create();
        options.scope = StorageScope.User;
        return options;
    }
    flushLocationStorageActions() {
        if (this.locationCloudStore) {
            while (this.waitingForLocationStore.length) {
                let next = this.waitingForLocationStore.shift();
                next.resolve(this.locationCloudStore);
            }
        }
        else if (this.errorInCloudStore) {
            while (this.waitingForLocationStore.length) {
                let next = this.waitingForLocationStore.shift();
                next.reject(this.errorInCloudStore);
            }
        }
    }
    withLocationCloudStore() {
        return new Promise((resolve, reject) => {
            let storeState = { resolve: resolve, reject: reject };
            this.waitingForLocationStore.push(storeState);
            this.flushLocationStorageActions();
        });
    }
    saveToCloudStore(stateAsString) {
        return new Promise((resolve, reject) => {
            this.withLocationCloudStore().then((locationCloudStore) => {
                locationCloudStore.setValue(RemoteStorage.LocationModelStateKeyName, stateAsString, this.writeOptions, () => {
                    resolve();
                }, (code, description) => {
                    reject(new Error(description));
                });
            });
        });
    }
    async save(stateAsString) {
        return await this.saveToCloudStore(stateAsString);
    }
    static makeCloudStorageReadOptions() {
        let options = CloudStorageReadOptions.create();
        options.scope = StorageScope.User;
        return options;
    }
    loadFromCloudStore() {
        return new Promise((resolve, reject) => {
            this.withLocationCloudStore()
                .then((locationCloudStore) => {
                locationCloudStore.getValue(RemoteStorage.LocationModelStateKeyName, this.readOptions, (key, value) => {
                    let stateAsString = value;
                    if (!stateAsString) {
                        let error = "[loadFromCloudStore]: no state in cloud storage";
                        this.log(error);
                        reject(new Error(error));
                    }
                    else {
                        this.log("[loadFromCloudStore]: load successful");
                        resolve(stateAsString);
                    }
                }, (code, description) => {
                    let error = "load fail: " + code + " " + description;
                    this.log("[loadFromCloudStore] Error:" + error);
                    reject(new Error(error));
                });
            })
                .catch((error) => {
                this.log("[loadFromCloudStore] Error:" + error);
                reject(error);
            });
        });
    }
    async load() {
        return await this.loadFromCloudStore();
    }
    serializeLocation(location) {
        return new Promise((resolve, reject) => {
            this.locationCloudStorageModule.storeLocation(location, (serializedLocationId) => {
                resolve(serializedLocationId);
            }, (err) => {
                reject(new Error("[LocationCloudStorageModule] failed to serialize location - " +
                    err));
            });
        });
    }
    deSerializeLocation(serializedLocationId) {
        return new Promise((resolve, reject) => {
            this.locationCloudStorageModule.retrieveLocation(serializedLocationId, (location) => {
                resolve(location);
            }, (error) => {
                reject(new Error("[LocationCloudStorageModule] failed to deserialize location - " +
                    serializedLocationId +
                    " " +
                    error));
            });
        });
    }
}
class LocalStorage extends IStorage {
    constructor() {
        super();
    }
    async save(stateAsString) {
        global.persistentStorageSystem.store.putString(LocalStorage.LocationModelStateKeyName, stateAsString);
    }
    async load() {
        this.log("model loading ...");
        let stateAsString = global.persistentStorageSystem.store.getString(LocalStorage.LocationModelStateKeyName);
        if (stateAsString == "") {
            let errorMsg = "no local state found";
            this.log(errorMsg);
            throw new Error(errorMsg);
        }
        else {
            this.log("local load successful");
            return stateAsString;
        }
    }
    serializeLocation(location) {
        return Promise.resolve(location.toSerialized());
    }
    deSerializeLocation(serializedLocationId) {
        return new Promise((resolve, reject) => {
            try {
                resolve(LocationAsset.fromSerialized(serializedLocationId));
            }
            catch (err) {
                reject(new Error("[LocalStorage] failed to deserialize location - " +
                    serializedLocationId +
                    " " +
                    err));
            }
        });
    }
}
class PersistentStorage {
    constructor(locationCloudStorageModule) {
        this.logger = Logging_1.LoggerVisualization.createLogger("persistence");
        this.log = this.logger.log.bind(this.logger);
        this.locationCloudStorageModule = locationCloudStorageModule;
        if (this.locationCloudStorageModule === undefined) {
            this.storage = new LocalStorage();
        }
        else {
            this.storage = new RemoteStorage(locationCloudStorageModule);
        }
    }
    // De-Serialize string to LocationAsset
    retrieveLocation(serializedLocationId) {
        if (global.deviceInfoSystem.isEditor()) {
            return Promise.resolve(LocationAsset.getAROrigin());
        }
        return this.storage.deSerializeLocation(serializedLocationId);
    }
    // Serialize LocationAsset to string
    storeLocation(location) {
        if (global.deviceInfoSystem.isEditor()) {
            return Promise.resolve("ls-preview-location-id");
        }
        return this.storage.serializeLocation(location);
    }
    // Model storage
    async saveToStore(stateAsString) {
        await this.storage.save(stateAsString);
        this.log("save successful");
    }
    async loadFromStore() {
        let stateAsString = await this.storage.load();
        this.log("load successful");
        return stateAsString;
    }
}
exports.PersistentStorage = PersistentStorage;
//# sourceMappingURL=PersistentStorage.js.map