import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id:btnCustom
    radius: height / 2
    color: buttonColor
    clip: true
    width: txtButtonText.implicitWidth + 20 * dpiToPixelValue
    height: baseButtonHeight
    signal clicked;
    property color baseColor: "#E5CA05"
    property color baseSelectingColor: "#0B132D"
    property color baseTextColor: "#0B132D"
    property int labelFontSize: 14

    property color buttonColor: baseColor
    property string buttonText: ""
    property color textColor: baseTextColor

    Text {
        id:txtButtonText
        text: buttonText
        color: textColor
        anchors.centerIn: parent
        font.pixelSize: labelFontSize
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            btnCustom.clicked()
        }
    }
}
