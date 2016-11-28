'use strict';

// 创建一个 Promise 对象的构造函数，它接受一个函数作为参数，
// 调用这个函数的时候，会传入 resolve 和 reject 方法。
function MyPromise (resolver) {
    this.status = 0;    // 0: pending, 1: fulfilled, 2: rejected
    this.value = null;  // store value once FULFILLED or REJECTED
    this.handlers = []; // store sucess & failure handlers

    doResolve.call(this, resolver);
}

function doResolve (resolver) {
    var called = false;
    function resolvePromise (value) {
        if (called) {
            return;
        } else {
            called = true;
            resolve.call(this, value);
        }
    }

    function rejectPromise (reason) {
        if (called) {
            return;
        } else {
            called = true;
            reject.call(this, reason);
        }
    }

    try {
        resolver(resolvePromise.bind(this), rejectPromise.bind(this));
    } catch(e) {
        rejectPromise(e);
    }
}

// 当使用 new Promise(function(resolve, reject) {...}); 构造时，会进入 doResolve，
// 这时会执行传入给 new Promise 的参数，并给出 resolve 和 reject 的实现。
// 为了保证 resolve 或 reject 总共只能被调用一次，这里用到了一个闭包。
// 具体的 resolve 和 reject 实现:
function resolve (value) {
    try {
        if (this === value) {
            throw new TypeError('A promise cannot be resolved with itself.');
        }
        if (value && (typeof value === 'object' || typeof value === 'function')) {
            var then = value.then;
            if (typeof then === 'function') {
                doResolve.call(this, then.bind(value));
                return;
            }
        }
        this.status = 1;
        this.value = value;
        dequeue.call(this);
    } catch(e) {
        reject(e);
    }
}

function reject (reason) {
    this.status = 2;
    this.value = reason;
    dequeue.call(this);
}

// 具体的 resolve 实现中，会判断解决的值是否是一个 thenable，如果是的话，
// 就会去执行这个 then 函数，并且接受它的状态和返回值。如果不是，就直接使用该值解决这个 promise。
// 可以想象，当执行 promise 的 then 方法时，其实是完成了一个类似观察者模式的注册过程。
// 当 promise 还处于 pending 状态时，回调函数会被暂时存储起来，待到解决或失败时再执行，
// 但是当 then 发现这个 promise 已经完成了状态转换，便可以根据状态立即执行回调了。
// 在这里，使用了 this.handlers 数组来暂存 then 的回调函数，
// 当状态改变时，会调用 dequeue 方法来处理队列。
function dequeue () {
    var handler;
    while (this.handlers.length) {
        handler = this.handlers.shift();
        handle.call(this, handler.thenPromise, handler.onFulfilled, handler.onRejected);
    }
}

// 最后是核心方法 then 的实现。根据规范，它必须返回一个 promise，
// 并根据 onFulfilled 或 onRejected 回调的返回值来决定是将它标记为完成还是失败。
MyPromise.prototype.then = function(onFulfilled, onRejected) {
    var self = this;
    var thenPromise = new MyPromise(function() {});

    if (!self.status) {
        self.handlers.push({
            thenPromise: thenPromise,
            onFulfilled: onFulfilled,
            onRejected: onRejected
        });
    } else {
        handle.call(self, thenPromise, onFulfilled, onRejected);
    }

    return thenPromise;
};

// 在 handle 函数中，立即调用回调函数，并且根据回调函数的类型
// 来改变 then 方法返回的 promise 的状态，这样就形成了一个 promise 链条。
function handle (thenPromise, onFulfilled, onRejected) {
    var self = this;

    setTimeout(function() {
        var callback, ret;
        if (self.status == 1) {
            callback = onFulfilled;
        } else {
            callback = onRejected;
        }
        if (typeof callback === 'function') {
            try {
                ret = callback(self.value);
                resolve.call(thenPromise, ret);
            } catch(e) {
                reject.call(thenPromise, e);
            }
            return;
        }
        if (self.status == 1) {
            resolve.call(thenPromise, self.value);
        } else {
            reject.call(thenPromise, self.value);
        }
    }, 1);
}

//测试MyPromise是否实现
function waitPromise (param) {
  return new MyPromise(function(resolve, reject) {
    setTimeout(function() {
      resolve(param);
    }, 1000);
  });
}

waitPromise('壁虎吃了').then(function(response) {
  console.log(response);
  return waitPromise('一只蚊子');
}).then(function(response) {
  console.log(response);
  return waitPromise('两只蚊子');
}).then(function(response) {
  console.log(response);
  return waitPromise('三只蚊子');
}).then(function(response) {
  console.log(response);
  return waitPromise('吃饱了...');
}).then(console.log.bind(console));
