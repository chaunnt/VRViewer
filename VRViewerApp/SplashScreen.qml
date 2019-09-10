import QtQuick 2.0
import VRViewerPlugins 1.0
Item {
    id:itemSplash
    Image {
        id: imgLogo
        source: "qrc:/AppLogo.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width / 4 * 3
        anchors.centerIn: parent
    }

    Loader {
        id: appLoader
        anchors.fill: parent
    }

    Timer {
        id: tmStartApp
        interval: 2000
        repeat: false
        running: true
        onTriggered: {
            Action.dispatch("DisplayLoginScreen")
        }
    }
}
