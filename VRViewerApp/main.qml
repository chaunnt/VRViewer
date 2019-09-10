import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import VRViewerPlugins 1.0
import ProductManagement 1.0
import Authentication 1.0


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 720
    height: 1280
    Loader{
        id:loaderMainWindow
        anchors.fill: parent
    }
    property QtObject appPresenter: ProductManagementPresenter{}

    ActionListener {
        actions: [ "ProductSelected" ]
        onTriggered: {
            console.log(data.activeProductName)
            loaderMainWindow.setSource("qrc:/QML/CameraView.qml", {productSource: data.activeProductName})
        }
    }

    ActionListener {
        actions: [ "DisplayListProduct" ]
        onTriggered: {
            loaderMainWindow.setSource("qrc:/QML/ProductList.qml", {productListPresenter: appPresenter})
        }
    }
    ActionListener {
        actions: [ "DisplayLoginScreen" ]
        onTriggered: {
            loaderMainWindow.setSource("qrc:/QML/ScreenLogin.qml")
        }
    }
    Loader{
        id:loaderSplash
        anchors.fill: parent
    }

    Component.onCompleted: {
        loaderMainWindow.setSource("qrc:/SplashScreen.qml")
    }
}
