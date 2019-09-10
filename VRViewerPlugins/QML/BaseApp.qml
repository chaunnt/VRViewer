import QtQuick 2.0
import VRViewerPlugins 1.0

Item {
    width:  1280
    height:  720
    property string screenName: ""
    property int headerHeight: 40 * dpiToPixelValue
    Rectangle {
        width: parent.width
        height: headerHeight
        color: Theme.general.baseColor
        z: 10
        Rectangle {
            width: height
            height: parent.height * 80 / 100
            color: color
        }
    }
}
