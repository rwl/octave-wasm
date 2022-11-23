importScripts("https://unpkg.com/promise-worker/dist/promise-worker.register.js", "octave.js")
// import registerPromiseWorker from "https://unpkg.com/promise-worker/dist/promise-worker.register.js";
// import OCTAVE from "octave.js";

let Module = {
  // locateFile: function(url, scriptDirectory) {
  //   return '/' + url;
  // }
};

registerPromiseWorker(function(message) {
  if (message === "init") {
    return new Promise(function(resolve, reject) {
      try {
        OCTAVE(Module).then(() => resolve());
      } catch (e) {
        reject(e);
      }
    });
  } else {
    try {
      return Module[message.ident](...message.args);
    } catch (e) {
      console.error(e);
    }
  }
});
