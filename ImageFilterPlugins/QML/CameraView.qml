import QtQuick 2.0
import QtQuick.Controls 2.0
import QtMultimedia 5.0
import VRViewerPlugins 1.0

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
        transform: [
            Scale {
                id: zoomScale
            },
            Translate {
                id: zoomTranslate
            }
        ]
    }
    Slider {
        id:zoomVideo
        orientation: Qt.Vertical
        from: 1
        to: 3
        stepSize: 0.01
        anchors{
            left:parent.left
            leftMargin:5
            verticalCenter:parent.verticalCenter
        }
        onValueChanged: {
            zoomScale.xScale = zoomVideo.value
            zoomScale.yScale = zoomVideo.value
        }
    }

    Image {
        id: photoPreview
        source: productSource
        width: parent.width / 2
        fillMode: Image.PreserveAspectFit
        property bool isResizing: false
        Rectangle{
            id:recPhotoBorder
            anchors.fill: parent
            border.color: Theme.general.baseColor
            border.width: 3
            radius: 5 * dpiToPixelValue
            visible: false
            color: "transparent"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: !photoPreview.isResizing
            enabled: !photoPreview.isResizing
            drag.target: photoPreview
            drag.minimumX: 0 - photoPreview.width + 10
            drag.maximumX: cameraViewer.width
            drag.minimumY: 0 - photoPreview.height + 10
            drag.maximumY: cameraViewer.height
            onClicked: {
                recPhotoBorder.visible = true
                tmAutoHideResizeIcon.start()
            }
        }

        Timer{
            id:tmAutoHideResizeIcon
            interval: 3000
            onTriggered: {
                recPhotoBorder.visible = false
            }
        }
    }
    Item{
        anchors.top: parent.top
        anchors.left: parent.left
        width: imgBackIcon.width + txtBack.width + 5 * dpiToPixelValue
        height: 40 * dpiToPixelValue
        Image {
            id: imgBackIcon
            source: "qrc:/Images/LeftArrow_White.png"
            fillMode: Image.PreserveAspectFit
            height: 40 * dpiToPixelValue
            anchors.top: parent.top
            anchors.left: parent.left
        }
        Text {
            id:txtBack
            text: qsTr("Quay lại")
            color: "white"
            anchors.top: parent.top
            anchors.right: parent.right
            font.pixelSize: 16 * dpiToPixelValue
            height: parent.height
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                Action.dispatch("DisplayListProduct")
            }
        }
    }
}
