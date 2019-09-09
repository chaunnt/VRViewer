import QtQuick 2.0
import VRViewerPlugins 1.0
import QtMultimedia 5.12

Item {
    id:cameraViewer
    property string productSource
    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }
        focus {
            focusMode: CameraFocus.FocusContinuous
            focusPointMode: CameraFocus.FocusPointAuto
        }
        flash.mode: Camera.FlashRedEyeReduction

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
            }
        }
    }

    VideoOutput {
        source: camera
        anchors.fill: parent
        focus : visible // to receive focus and capture key events when visible
        autoOrientation: true
        fillMode: VideoOutput.Stretch
    }

    Image {
        id: photoPreview
        source: productSource
        width: parent.width / 2
        fillMode: Image.PreserveAspectFit
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            drag.target: photoPreview
            drag.minimumX: 0
            drag.maximumX: cameraViewer.width
            drag.minimumY: 0
            drag.maximumY: cameraViewer.height
        }
    }
}
