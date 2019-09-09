import QtQuick 2.0
import VRViewerPlugins 1.0
import ImageFilterPlugins 1.0

Item {
    id:productListView
    property QtObject productListPresenter

    ListView {
        width: parent.width
        height: parent.height
        model:productListPresenter.productList
        spacing: 10
        y: 10

        delegate: Rectangle {
            width: productListView.width - 20
            height: productListView.height- 40
            color: "transparent"
            border.width: 1
            border.color: "lightgray"
            radius: 20
            clip: true
            x: 10

            Image {
                id: imgProductImage
                y: 5
                source: modelData.productSource
                fillMode: Image.PreserveAspectFit
                width: parent.height / 10 * 9
                anchors.centerIn: parent
            }
            Rectangle {
                width: parent.width
                height: 1
                color: "lightgray"
                anchors.bottom: txtProductName.top
                anchors.bottomMargin: 5
            }
            Text {
                id: txtProductName
                text: modelData.productName
                font.pixelSize: 36
                font.bold: true
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                height: parent.height / 10
                x: 10
                width: parent.width - 20
                elide: Text.ElideRight
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Action.dispatch("ProductSelected", {activeProductName: modelData.productSource})
                }
            }
        }
    }
}
