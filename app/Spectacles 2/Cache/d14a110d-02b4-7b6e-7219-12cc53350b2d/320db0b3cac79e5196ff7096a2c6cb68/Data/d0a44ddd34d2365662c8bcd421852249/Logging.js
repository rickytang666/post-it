"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var LoggerVisualization_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.LoggerVisualization = exports.Logger = void 0;
var __selfType = requireType("./Logging");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Queue_1 = require("./Queue");
class Logger {
    log(message) {
        this.bus.write(this.topic, message);
    }
}
exports.Logger = Logger;
// place to write things out exists ahead of component instantiation
class LoggerBus {
    constructor() {
        this.buffered = [];
    }
    write(topic, message) {
        this.buffered.push([topic, message]);
        this.flush();
    }
    flush() {
        if (!this.listener) {
            return;
        }
        this.buffered.forEach(([topic, message]) => {
            this.listener(topic, message);
        });
        this.buffered = [];
    }
}
let LoggerVisualization = LoggerVisualization_1 = class LoggerVisualization extends BaseScriptComponent {
    static get busInstance() {
        if (!LoggerVisualization_1.theLoggerBus) {
            LoggerVisualization_1.theLoggerBus = new LoggerBus();
        }
        return LoggerVisualization_1.theLoggerBus;
    }
    static createLogger(topic) {
        let logger = new Logger();
        logger.bus = LoggerVisualization_1.busInstance;
        logger.topic = topic;
        return logger;
    }
    write(topic, message) {
        const localText = `${topic}: ${message}`;
        if (this.loggerOutput != null && this.loggerOutput != undefined) {
            this.logQueue.enqueue(localText);
            let formatedLog = this.logQueue.peek(0);
            for (let index = 0; index < this.logQueue.size(); index++) {
                formatedLog += "\n" + this.logQueue.peek(index);
            }
            this.loggerOutput.text = formatedLog;
        }
        else {
            print("no textLogger: " + localText);
        }
        print(localText);
    }
    onAwake() {
        this.logQueue = new Queue_1.Queue(this.logLimit);
        this.write = this.write.bind(this);
        LoggerVisualization_1.busInstance.listener = this.write;
    }
};
exports.LoggerVisualization = LoggerVisualization;
exports.LoggerVisualization = LoggerVisualization = LoggerVisualization_1 = __decorate([
    component
], LoggerVisualization);
//# sourceMappingURL=Logging.js.map