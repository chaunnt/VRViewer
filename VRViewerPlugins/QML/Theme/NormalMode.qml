import QtQuick 2.0

QtObject {
    /*!
        Provides colours/assets/fonts for general elements.
     */
    property QtObject general: QtObject {
        readonly property color baseColor: "#7CCDFC"
        readonly property color baseSelectingColor: "#0078D7"
        readonly property color baseTextColor: "#0B132D"
    }

    /*!
        Provides colours/assets/fonts for login (For example) screen
    */
    property QtObject loginScreen: QtObject {

    }
}
