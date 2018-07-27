﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DicomImageViewer.ascx.cs" Inherits="AbsTech.UserControl.DicomImageViewer" %>

<html>
<head>
    <link href="../Content/bootstrap-3.1.0.min.css" rel="stylesheet" />
    <link href="../Content/dicomloader/cornerstone.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
        downloadAndView();
    });
    </script>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>ABSTECH</h1>
            <p class="lead">
                
            </p>
        </div>
        
        <div id="loadProgress">Image Load Progress:</div>

        <div class="row">
            <form id="form" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-1" for="wadoURL">URL</label>
                    <div class="col-sm-1">
                        <input class="form-control" type="text" id="wadoURL" style="display:none" placeholder="Enter WADO URL" value="https://raw.githubusercontent.com/abstech2019/AbsTech/master/AbsTech/Images/1.2.392.200036.9125.4.0.437218728.162610028.870646074.dcm">
                    </div>
                    <div class="col-sm-3">
                        <%--<button class="form-control" type="button" id="downloadAndView" class="btn btn-primary">Download and View</button>--%>
                    </div>
                </div>
                
            </form>
            
                        
        </div>
        <br>
        <button id="rotate" class="btn">Rotate 90</button>
        <br>
        <div class="row">
            <div class="col-md-6">
                <div style="width: 512px; height: 512px; position: relative; color: white; display: inline-block; border-style: solid; border-color: black;"
                    oncontextmenu="return false"
                    class='disable-selection noIbar'
                    unselectable='on'
                    onselectstart='return false;'
                    onmousedown='return false;'>
                    <div id="dicomImage"
                        style="width: 512px; height: 512px; top: 0px; left: 0px; position: absolute">
                    </div>
                    <div id="dicomImage1"
                        style="width: 512px; height: 512px; top: 0px; left: 0px; position: absolute">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <span>Transfer Syntax: </span><span id="transferSyntax"></span>
                <br>
                <span>SOP Class: </span><span id="sopClass"></span>
                <br>
                <span>Samples Per Pixel: </span><span id="samplesPerPixel"></span>
                <br>
                <span>Photometric Interpretation: </span><span id="photometricInterpretation"></span>
                <br>
                <span>Number Of Frames: </span><span id="numberOfFrames"></span>
                <br>
                <span>Planar Configuration: </span><span id="planarConfiguration"></span>
                <br>
                <span>Rows: </span><span id="rows"></span>
                <br>
                <span>Columns: </span><span id="columns"></span>
                <br>
                <span>Pixel Spacing: </span><span id="pixelSpacing"></span>
                <br>
                <span>Row Pixel Spacing: </span><span id="rowPixelSpacing"></span>
                <br>
                <span>Column Pixel Spacing: </span><span id="columnPixelSpacing"></span>
                <br>
                <span>Bits Allocated: </span><span id="bitsAllocated"></span>
                <br>
                <span>Bits Stored: </span><span id="bitsStored"></span>
                <br>
                <span>High Bit: </span><span id="highBit"></span>
                <br>
                <span>Pixel Representation: </span><span id="pixelRepresentation"></span>
                <br>
                <span>WindowCenter: </span><span id="windowCenter"></span>
                <br>
                <span>WindowWidth: </span><span id="windowWidth"></span>
                <br>
                <span>RescaleIntercept: </span><span id="rescaleIntercept"></span>
                <br>
                <span>RescaleSlope: </span><span id="rescaleSlope"></span>
                <br>
                <span>Basic Offset Table Entries: </span><span id="basicOffsetTable"></span>
                <br>
                <span>Fragments: </span><span id="fragments"></span>
                <br>
                <span>Max Stored Pixel Value: </span><span id="minStoredPixelValue"></span>
                <br>
                <span>Min Stored Pixel Value: </span><span id="maxStoredPixelValue"></span>
                <br>
                <span>Total Time: </span><span id="totalTime"></span>
                <br>
                <span>Load Time: </span><span id="loadTime"></span>
                <br>
                <span>Decode Time: </span><span id="decodeTime"></span>
                <br>
            </div>
        </div>
    </div>
</body>

<!-- include the cornerstone library -->
<script src="../Scripts/DicomView/cornerstone.min.js"></script>
<script src="../Scripts/DicomView/cornerstoneMath.min.js"></script>
<script src="../Scripts/DicomView/cornerstoneTools.min.js"></script>
<script src="../Scripts/DicomView/exampleImageIdLoader.js"></script>
    <script src="../Scripts/DicomView/dicomParser.min.js"></script>

<!-- include the dicomParser library as the WADO image loader depends on it -->
<script src="../Scripts/DicomView/dicomParser.min.js"></script>

<!-- BEGIN Optional Codecs -->

<!-- OpenJPEG based jpeg 2000 codec -->
<script src="../Scripts/DicomView/codecs/openJPEG-FixedMemory.js"></script>

<!-- PDF.js based jpeg 2000 codec -->
<!-- NOTE: do not load the OpenJPEG codec if you use this one -->
<!-- <script src="../../codecs/jpx.min.js"></script> -->

<!-- JPEG-LS codec -->
<script src="../Scripts/DicomView/codecs/charLS-FixedMemory-browser.js"></script>

<!-- JPEG Lossless codec -->
<script src="../Scripts/DicomView/codecs/jpegLossless.js"></script>

<!-- JPEG Baseline codec -->
<script src="../Scripts/DicomView/codecs/jpeg.js"></script>

<!-- Deflate transfer syntax codec -->
<script src="../Scripts/DicomView/codecs/pako.min.js"></script>

<!-- END Optional Codecs -->

<!-- include the cornerstoneWADOImageLoader library -->
<script src="../Scripts/DicomView/cornerstoneWADOImageLoader.js"></script>
<%--<script src="../Scripts/DicomView/cornerstoneWADOImageLoaderWebWorker.min.js"></script>--%>

<%--<script src="../Scripts/DicomView/uids.js"></script>

<script src="../Scripts/DicomView/initializeWebWorkers.js"></script>--%>

<script>
    var loImage = null;
    cornerstoneWADOImageLoader.external.cornerstone = cornerstone;

    cornerstoneWADOImageLoader.configure({
        beforeSend: function (xhr) {
            // Add custom headers here (e.g. auth tokens)
            //xhr.setRequestHeader('APIKEY', 'my auth token');
        }
    });

    var loaded = false;

    function loadAndViewImage(imageId) {
        var element = document.getElementById('dicomImage');
        try {
            var start = new Date().getTime();
            cornerstone.loadAndCacheImage(imageId).then(function (image) {
                //console.log(image);
                loImage = image;
                var viewport = cornerstone.getDefaultViewportForImage(element, image);
                cornerstone.displayImage(element, image, viewport);
                if (loaded === false) {
                    cornerstoneTools.mouseInput.enable(element);
                    cornerstoneTools.mouseWheelInput.enable(element);
                    cornerstoneTools.wwwc.activate(element, 1); // ww/wc is the default tool for left mouse button
                    cornerstoneTools.pan.activate(element, 2); // pan is the default tool for middle mouse button
                    cornerstoneTools.zoom.activate(element, 4); // zoom is the default tool for right mouse button
                    cornerstoneTools.zoomWheel.activate(element); // zoom is the default tool for middle mouse wheel
                    loaded = true;
                }

                function getTransferSyntax() {
                    const value = image.data.string('x00020010');
                    return value + ' [' + uids[value] + ']';
                }

                function getSopClass() {
                    const value = image.data.string('x00080016');
                    return value + ' [' + uids[value] + ']';
                }

                function getPixelRepresentation() {
                    const value = image.data.uint16('x00280103');
                    if (value === undefined) {
                        return;
                    }
                    return value + (value === 0 ? ' (unsigned)' : ' (signed)');
                }

                function getPlanarConfiguration() {
                    const value = image.data.uint16('x00280006');
                    if (value === undefined) {
                        return;
                    }
                    return value + (value === 0 ? ' (pixel)' : ' (plane)');
                }


                document.getElementById('transferSyntax').textContent = getTransferSyntax();
                document.getElementById('sopClass').textContent = getSopClass();
                document.getElementById('samplesPerPixel').textContent = image.data.uint16('x00280002');
                document.getElementById('photometricInterpretation').textContent = image.data.string('x00280004');
                document.getElementById('numberOfFrames').textContent = image.data.string('x00280008');
                document.getElementById('planarConfiguration').textContent = getPlanarConfiguration();
                document.getElementById('rows').textContent = image.data.uint16('x00280010');
                document.getElementById('columns').textContent = image.data.uint16('x00280011');
                document.getElementById('pixelSpacing').textContent = image.data.string('x00280030');
                document.getElementById('rowPixelSpacing').textContent = image.rowPixelSpacing;
                document.getElementById('columnPixelSpacing').textContent = image.columnPixelSpacing;
                document.getElementById('bitsAllocated').textContent = image.data.uint16('x00280100');
                document.getElementById('bitsStored').textContent = image.data.uint16('x00280101');
                document.getElementById('highBit').textContent = image.data.uint16('x00280102');
                document.getElementById('pixelRepresentation').textContent = getPixelRepresentation();
                document.getElementById('windowCenter').textContent = image.data.string('x00281050');
                document.getElementById('windowWidth').textContent = image.data.string('x00281051');
                document.getElementById('rescaleIntercept').textContent = image.data.string('x00281052');
                document.getElementById('rescaleSlope').textContent = image.data.string('x00281053');
                document.getElementById('basicOffsetTable').textContent = image.data.elements.x7fe00010.basicOffsetTable ? image.data.elements.x7fe00010.basicOffsetTable.length : '';
                document.getElementById('fragments').textContent = image.data.elements.x7fe00010.fragments ? image.data.elements.x7fe00010.fragments.length : '';
                document.getElementById('minStoredPixelValue').textContent = image.minPixelValue;
                document.getElementById('maxStoredPixelValue').textContent = image.maxPixelValue;
                var end = new Date().getTime();
                var time = end - start;
                document.getElementById('totalTime').textContent = time + "ms";
                document.getElementById('loadTime').textContent = image.loadTimeInMS + "ms";
                document.getElementById('decodeTime').textContent = image.decodeTimeInMS + "ms";

            }, function (err) {
                alert(err);
            });
        }
        catch (err) {
            alert(err);
        }
    }

    function downloadAndView() {
        let url = document.getElementById('wadoURL').value;

        // prefix the url with wadouri: so cornerstone can find the image loader
        url = "wadouri:" + url;

        // image enable the dicomImage element and activate a few tools
        loadAndViewImage(url);
    }

    cornerstone.events.addEventListener('cornerstoneimageloadprogress', function (event) {
        const eventData = event.detail;
        const loadProgress = document.getElementById('loadProgress');
        loadProgress.textContent = `Image Load Progress: ${eventData.percentComplete}%`;
    });

    function getUrlWithoutFrame() {
        var url = document.getElementById('wadoURL').value;
        var frameIndex = url.indexOf('frame=');
        if (frameIndex !== -1) {
            url = url.substr(0, frameIndex - 1);
        }
        return url;
    }

    var element = document.getElementById('dicomImage');
    cornerstone.enable(element);

    //document.getElementById('downloadAndView').addEventListener('click', function (e) {
    //    downloadAndView();
    //});

    //const form = document.getElementById('form');
    //form.addEventListener('submit', function () {
    //    downloadAndView();
    //    return false;
    //});

     const form = document.getElementById('form');
    form.addEventListener('submit', function() {
        downloadAndView();
        return false;
    });


    document.getElementById('rotate').addEventListener('click', function (e) {
               var image = cornerstone.getImage(element);
				var viewport = cornerstone.getViewport(element);
                viewport.rotation += 90;
				cornerstone.setViewport(element, viewport);
        });


    //document.getElementById('toggleCollapseInfo').addEventListener('click', function () {
    //    if (document.getElementById('collapseInfo').style.display === 'none') {
    //        document.getElementById('collapseInfo').style.display = 'block';
    //    } else {
    //        document.getElementById('collapseInfo').style.display = 'none';
    //    }
    //});
</script>
</html>
