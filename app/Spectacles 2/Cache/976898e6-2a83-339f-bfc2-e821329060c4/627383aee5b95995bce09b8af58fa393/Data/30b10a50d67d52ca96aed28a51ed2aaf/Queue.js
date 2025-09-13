"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Queue = void 0;
class Queue {
    constructor(capacity = Infinity) {
        this.capacity = capacity;
        this.storage = [];
    }
    enqueue(item) {
        if (this.size() === this.capacity) {
            this.dequeue();
        }
        this.storage.push(item);
    }
    dequeue() {
        return this.storage.shift();
    }
    peek(index) {
        return this.storage[index];
    }
    size() {
        return this.storage.length;
    }
}
exports.Queue = Queue;
//# sourceMappingURL=Queue.js.map