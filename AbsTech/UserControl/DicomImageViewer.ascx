<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DicomImageViewer.ascx.cs" Inherits="AbsTech.UserControl.DicomImageViewer" %>
<html>
<head>
    <title></title>
    <style>
        .overlay {
            /* prevent text selection on overlay */
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            /* ignore pointer event on overlay */
            pointer-events: none;
        }
    </style>
</head>
<body>

    <asp:Panel ID="pnlImageViewer" runat="server" Height="639px">
        <div class="container">

            <h1>Sample Dicom Viewer
    </h1>
            <br>
            <br>

            <!-- note we disable selection on the top most div -->
            <div style="width: 512px; height: 512px; position: relative; color: white"
                oncontextmenu="return false"
                onmousedown="return false">

                <div id="dicomImage"
                    style="width: 512px; height: 512px; top: 0px; left: 0px; position: absolute">
                </div>

                <div id="topleft" class="overlay" style="position: absolute; top: 0px; left: 0px">
                    Patient Name
       
                </div>
                <div id="topright" class="overlay" style="position: absolute; top: 0px; right: 0px">
                    Hospital
       
                </div>
                <div id="bottomright" class="overlay" style="position: absolute; bottom: 0px; right: 0px">
                    Zoom:
       
                </div>
                <div id="bottomleft" class="overlay" style="position: absolute; bottom: 0px; left: 0px">
                    WW/WC:
       
                </div>
            </div>

        </div>
    </asp:Panel>

</body>
    
    <script src="../Scripts/DicomView/cornerstone.min.js"></script>
    <script src="../Scripts/DicomView/exampleImageIdLoader.js"></script>
<script>
    // image enable the element
    const element = document.getElementById('dicomImage');
    cornerstone.enable(element);

    // load the image and display it
    const imageId = 'example://1';
    cornerstone.loadImage(imageId).then(function (image) {
        console.log(imageId);
        console.log(image);
        cornerstone.displayImage(element, image);
        const viewport = cornerstone.getViewport(element);
        console.log(viewport);
        document.getElementById('bottomright').textContent = "Zoom: " + viewport.scale + "x";
        document.getElementById('bottomleft').textContent = "WW/WC:" + Math.round(viewport.voi.windowWidth)
            + "/" + Math.round(viewport.voi.windowCenter);
    });

    // add event handlers to mouse move to adjust window/center
    element.addEventListener('mousedown', function (e) {
        let lastX = e.pageX;
        let lastY = e.pageY;

        function mouseMoveHandler(e) {
            const deltaX = e.pageX - lastX;
            const deltaY = e.pageY - lastY;
            lastX = e.pageX;
            lastY = e.pageY;

            let viewport = cornerstone.getViewport(element);
            viewport.voi.windowWidth += (deltaX / viewport.scale);
            viewport.voi.windowCenter += (deltaY / viewport.scale);
            cornerstone.setViewport(element, viewport);

            document.getElementById('bottomleft').textContent = "WW/WC:" + Math.round(viewport.voi.windowWidth)
                + "/" + Math.round(viewport.voi.windowCenter);
        }

        function mouseUpHandler() {
            document.removeEventListener('mousemove', mouseMoveHandler);
            document.removeEventListener('mouseup', mouseUpHandler);
        }

        document.addEventListener('mousemove', mouseMoveHandler);
        document.addEventListener('mouseup', mouseUpHandler);
    });
</script>
</html>
