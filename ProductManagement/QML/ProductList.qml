import QtQuick 2.0
import VRViewerPlugins 1.0

Item {
    id:productListView
    property QtObject productListPresenter

    ListView {
        id: lvProductList
        width: parent.width - 10 * dpiToPixelValue
        height: parent.height - recProductListTitle.height - 10 * dpiToPixelValue
        model: productListPresenter.productList
        spacing: 10 * dpiToPixelValue
        y: 10 * dpiToPixelValue + recProductListTitle.height

        delegate: Rectangle {
            width: productListView.width - 20
            height: productListView.height- 40
            color: "transparent"
            border.width: 1
            border.color: "lightgray"
            radius: 5 * dpiToPixelValue
            clip: true
            x: 10

            Image {
                id: imgProductImage
                y: 5
                source: modelData.productSource
                fillMode: Image.PreserveAspectFit
                width: parent.width / 3
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

    ListModel {
        id: lmShopList
        ListElement {
            shopName: "Túi vải Giovatory"
        }
        ListElement {
            shopName: "Cây cảnh giả JassiDecor"
        }
        ListElement {
            shopName: "Trang sức vòng cổ"
        }
        ListElement {
            shopName: "Trang sức bông tai"
        }
    }

    Rectangle {
        id:recProductListTitle
        width: parent.width
        height: shopListDropdown.height
        color: "white"

        CustomDropDownlist {
            id: shopListDropdown
            width: parent.width - 10 * dpiToPixelValue
            height: 60 * dpiToPixelValue
            currentTextValue: qsTr("Chọn sản phẩm mà bạn muốn xem thử")
            model:lmShopList
            x: parent.width / 2 - width / 2
            y: 5 * dpiToPixelValue
            onCurrentTextValueChanged: {
                productListPresenter.updateProductListByStore(currentTextValue)
            }
        }
    }
}
