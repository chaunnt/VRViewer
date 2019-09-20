import QtQuick 2.9
import QtQuick.Controls 2.0
import VRViewerPlugins 1.0

Rectangle{
    id: cbbMain
    property var model
    property string currentTextValue: ""
    property int currentValue: -1
    // Option
    property int cbbPopupItemHeight: Settings.baseButtonHeight
    property int fontSize: 15 * dpiToPixelValue
    onActiveFocusChanged: {
        if(activeFocus){
            recDisplay.border.color = Theme.general.baseSelectingColor
        }else{
            recDisplay.border.color = Theme.general.baseColor
        }
    }

    height: Settings.baseButtonHeight
    Rectangle {
        id: recDisplay
        width: parent.width
        height: parent.height
        radius: 5 * dpiToPixelValue
        y: parent.height / 2 - height / 2
        border.color: Theme.general.baseColor
        border.width: 1
        Text{
            id: txtDisplay
            text: currentTextValue
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            height: parent.height
            width: parent.width - parent.height / 2
            x:(parent.width - parent.height / 2) / 2 - width / 2
            color: Theme.general.baseColor
            font.pixelSize: fontSize
            elide: Text.ElideRight
        }
        MouseArea {
            anchors.fill: txtDisplay
            onClicked: {
                cbbMain.forceActiveFocus()
                menuCombobox.open()
            }
        }
    }

    Image {
        id: imgCbbLeftIcon
        width: height
        height: parent.height / 2
        source: "qrc:/Applications/Images/SortDownIcon_Unselected.png"
        anchors.right: parent.right
        anchors.rightMargin: 5 * dpiToPixelValue
        y:parent.height / 2 - height / 2
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menuCombobox.open()
            }
        }
    }

    Menu {
        id: menuCombobox
        y: cbbMain.height
        height: recComboboxPopup.height
        width: cbbMain.width
        background: Rectangle{
            color: "transparent"
        }

        onVisibleChanged: {
            if(visible) {
                lvComboboxPopup.model = cbbMain.model
            }
        }

        contentItem: Rectangle {
            id: recComboboxPopup
            width: lvComboboxPopup.width
            height: lvComboboxPopup.height + (recBackGround.radius * 2)
            clip: true

            Rectangle {
                id: recBackGround
                border.color: Theme.general.baseColor
                radius: 5 * dpiToPixelValue
                anchors.fill: parent
            }

            ListView {
                id: lvComboboxPopup
                width: cbbMain.width
                height: lvComboboxPopup.count > 10 ? cbbPopupItemHeight * 10 : cbbPopupItemHeight * lvComboboxPopup.count
                y: recBackGround.radius
                snapMode: ListView.SnapToItem
                delegate: Rectangle {
                    width: cbbMain.width
                    height: cbbPopupItemHeight
                    color: "transparent"
                    Text{
                        id: txtComboboxNameItem
                        text: shopName
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        x: 5 * dpiToPixelValue
                        height: parent.height
                        width: parent.width - 10 * dpiToPixelValue
                        color: Theme.general.baseColor
                        font.pixelSize: fontSize
                        elide: Text.ElideRight
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            console.log("cbbMain.currentTextValue: " +  cbbMain.currentTextValue)
                            cbbMain.currentTextValue = txtComboboxNameItem.text
//                            cbbMain.currentValue = modelData.dataId
                            menuCombobox.close()
                        }
                        onEntered: {
                            parent.color = "#d3e0ee"
                        }
                        onExited: {
                            parent.color = "transparent"
                        }
                    }
                }
            }
        }
    }
}

