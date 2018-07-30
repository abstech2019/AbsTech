// This script will load the WebWorkers and Codecs from unpkg url

function getBlobUrl (url) {
  const baseUrl = window.URL || window.webkitURL;
  const blob = new Blob([`importScripts('${url}')`], { type: 'application/javascript' });

  return baseUrl.createObjectURL(blob);
}

function UrlExists (url) {
	alert(url);
  const http = new XMLHttpRequest();
  http.open('HEAD', url, false);
  http.send();

  return http.status !== 404;
}

// let webWorkerUrl = getBlobUrl('https://unpkg.com/cornerstone-wado-image-loader/dist/cornerstoneWADOImageLoaderWebWorker.min.js');
// let codecsUrl = getBlobUrl('https://unpkg.com/cornerstone-wado-image-loader/dist/cornerstoneWADOImageLoaderCodecs.js');

//let webworkerurl = getbloburl('https://raw.githubusercontent.com/abstech2019/AbsTech/master/AbsTech/Scripts/DicomView/cornerstoneWADOImageLoaderWebWorker.min.js');
 //let codecsurl = getbloburl('https://raw.githubusercontent.com/abstech2019/AbsTech/master/AbsTech/Scripts/DicomView/cornerstoneWADOImageLoaderCodecs.js');

// if (UrlExists('../../dist/cornerstoneWADOImageLoaderWebWorker.min.js')) {
  // webWorkerUrl = '../../dist/cornerstoneWADOImageLoaderWebWorker.min.js';
// }

// if (UrlExists('../../dist/cornerstoneWADOImageLoaderCodecs.js')) {
  // codecsUrl = '../dist/cornerstoneWADOImageLoaderCodecs.js';
// }
let webWorkerUrl = "";
let codecsUrl = "";
webWorkerUrl = '../Scripts/DicomView/cornerstoneWADOImageLoaderWebWorker.min.js';
codecsUrl = '../DicomView/cornerstoneWADOImageLoaderCodecs.js';
try {
  window.cornerstoneWADOImageLoader.webWorkerManager.initialize({
    maxWebWorkers: 4,
    startWebWorkersOnDemand: true,
    webWorkerPath: webWorkerUrl,
    webWorkerTaskPaths: [],
    taskConfiguration: {
      decodeTask: {
        loadCodecsOnStartup: true,
        initializeCodecsOnStartup: false,
        codecsPath: codecsUrl,
        usePDFJS: false,
        strict: true
      }
    }
  });
} catch (error) {
  throw new Error('cornerstoneWADOImageLoader is not loaded');
}
