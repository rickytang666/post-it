import { setTimeout, clearTimeout } from "../Util/debounce";
import { LoggerVisualization } from "./Logging";

interface LocationStoreState {
  resolve: (locationCloudStore: LocationCloudStore) => void;
  reject: (any) => void;
}

abstract class IStorage {
  static readonly LocationModelStateKeyName = "locationModelState";

  // for model state
  abstract save(stateAsString: string): Promise<void>;
  abstract load(): Promise<string>;

  // location de/serialize
  abstract serializeLocation(location: LocationAsset): Promise<string>;
  abstract deSerializeLocation(
    serializedLocationId: string,
  ): Promise<LocationAsset>;

  private logger = LoggerVisualization.createLogger("persistence");
  public log = this.logger.log.bind(this.logger);
}

class RemoteStorage extends IStorage {
  private waitingForLocationStore: LocationStoreState[] = [];

  locationCloudStore?: LocationCloudStore;
  errorInCloudStore?: string;
  locationCloudStorageModule: LocationCloudStorageModule;

  constructor(locationCloudStorageModule: LocationCloudStorageModule) {
    super();
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
      let errorMessage =
        "CloudStorageModule: failed to get location store: " + err + message;
      this.errorInCloudStore = errorMessage;
      this.flushLocationStorageActions();
      this.log(errorMessage);
    });

    this.locationCloudStorageModule.getNearbyLocationStores(options);
  }

  private writeOptions: CloudStorageWriteOptions =
    RemoteStorage.makeCloudStorageWriteOptions();
  static makeCloudStorageWriteOptions(): CloudStorageWriteOptions {
    let options = CloudStorageWriteOptions.create();
    options.scope = StorageScope.User;
    return options;
  }

  flushLocationStorageActions() {
    if (this.locationCloudStore) {
      while (this.waitingForLocationStore.length) {
        let next = this.waitingForLocationStore.shift()!;
        next.resolve(this.locationCloudStore);
      }
    } else if (this.errorInCloudStore) {
      while (this.waitingForLocationStore.length) {
        let next = this.waitingForLocationStore.shift()!;
        next.reject(this.errorInCloudStore);
      }
    }
  }

  withLocationCloudStore(): Promise<LocationCloudStore> {
    return new Promise<LocationCloudStore>((resolve, reject) => {
      let storeState: LocationStoreState = { resolve: resolve, reject: reject };
      this.waitingForLocationStore.push(storeState);
      this.flushLocationStorageActions();
    });
  }

  saveToCloudStore(stateAsString: string): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      this.withLocationCloudStore().then((locationCloudStore) => {
        locationCloudStore.setValue(
          RemoteStorage.LocationModelStateKeyName,
          stateAsString,
          this.writeOptions,
          (): void => {
            resolve();
          },
          (code, description): void => {
            reject(new Error(description));
          },
        );
      });
    });
  }

  async save(stateAsString: string): Promise<void> {
    return await this.saveToCloudStore(stateAsString);
  }

  private readOptions: CloudStorageReadOptions =
    RemoteStorage.makeCloudStorageReadOptions();
  static makeCloudStorageReadOptions(): CloudStorageReadOptions {
    let options = CloudStorageReadOptions.create();
    options.scope = StorageScope.User;
    return options;
  }

  loadFromCloudStore(): Promise<string> {
    return new Promise((resolve, reject) => {
      this.withLocationCloudStore()
        .then((locationCloudStore) => {
          locationCloudStore.getValue(
            RemoteStorage.LocationModelStateKeyName,
            this.readOptions,
            (key, value): void => {
              let stateAsString = value as string;
              if (!stateAsString) {
                let error = "[loadFromCloudStore]: no state in cloud storage";
                this.log(error);
                reject(new Error(error));
              } else {
                this.log("[loadFromCloudStore]: load successful");
                resolve(stateAsString);
              }
            },
            (code, description): void => {
              let error = "load fail: " + code + " " + description;
              this.log("[loadFromCloudStore] Error:" + error);
              reject(new Error(error));
            },
          );
        })
        .catch((error) => {
          this.log("[loadFromCloudStore] Error:" + error);
          reject(error);
        });
    });
  }

  async load(): Promise<string> {
    return await this.loadFromCloudStore();
  }

  serializeLocation(location: LocationAsset): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      this.locationCloudStorageModule.storeLocation(
        location,
        (serializedLocationId: string) => {
          resolve(serializedLocationId);
        },
        (err: string) => {
          reject(
            new Error(
              "[LocationCloudStorageModule] failed to serialize location - " +
                err,
            ),
          );
        },
      );
    });
  }

  deSerializeLocation(serializedLocationId: string): Promise<LocationAsset> {
    return new Promise<LocationAsset>((resolve, reject) => {
      this.locationCloudStorageModule.retrieveLocation(
        serializedLocationId,
        (location: LocationAsset) => {
          resolve(location);
        },
        (error: string) => {
          reject(
            new Error(
              "[LocationCloudStorageModule] failed to deserialize location - " +
                serializedLocationId +
                " " +
                error,
            ),
          );
        },
      );
    });
  }
}

class LocalStorage extends IStorage {
  constructor() {
    super();
  }

  async save(stateAsString: string): Promise<void> {
    global.persistentStorageSystem.store.putString(
      LocalStorage.LocationModelStateKeyName,
      stateAsString,
    );
  }

  async load(): Promise<string> {
    this.log("model loading ...");
    let stateAsString = global.persistentStorageSystem.store.getString(
      LocalStorage.LocationModelStateKeyName,
    ) as string;

    if (stateAsString == "") {
      let errorMsg = "no local state found";
      this.log(errorMsg);
      throw new Error(errorMsg);
    } else {
      this.log("local load successful");
      return stateAsString;
    }
  }

  serializeLocation(location: LocationAsset): Promise<string> {
    return Promise.resolve(location.toSerialized());
  }

  deSerializeLocation(serializedLocationId: string): Promise<LocationAsset> {
    return new Promise<LocationAsset>((resolve, reject) => {
      try {
        resolve(LocationAsset.fromSerialized(serializedLocationId));
      } catch (err: any) {
        reject(
          new Error(
            "[LocalStorage] failed to deserialize location - " +
              serializedLocationId +
              " " +
              err,
          ),
        );
      }
    });
  }
}

export class PersistentStorage {
  storage: IStorage;
  locationCloudStorageModule?: LocationCloudStorageModule;

  constructor(locationCloudStorageModule?: LocationCloudStorageModule) {
    this.locationCloudStorageModule = locationCloudStorageModule;

    if (this.locationCloudStorageModule === undefined) {
      this.storage = new LocalStorage();
    } else {
      this.storage = new RemoteStorage(locationCloudStorageModule);
    }
  }

  // De-Serialize string to LocationAsset
  retrieveLocation(serializedLocationId: string): Promise<LocationAsset> {
    if (global.deviceInfoSystem.isEditor()) {
      return Promise.resolve(LocationAsset.getAROrigin());
    }
    return this.storage.deSerializeLocation(serializedLocationId);
  }

  // Serialize LocationAsset to string
  storeLocation(location: LocationAsset): Promise<string> {
    if (global.deviceInfoSystem.isEditor()) {
      return Promise.resolve("ls-preview-location-id");
    }
    return this.storage.serializeLocation(location);
  }

  // Model storage
  async saveToStore(stateAsString: string): Promise<void> {
    await this.storage.save(stateAsString);
    this.log("save successful");
  }

  async loadFromStore(): Promise<string> {
    let stateAsString = await this.storage.load();
    this.log("load successful");
    return stateAsString;
  }

  private logger = LoggerVisualization.createLogger("persistence");
  private log = this.logger.log.bind(this.logger);
}
