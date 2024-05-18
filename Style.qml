import QtQuick 2.15
pragma Singleton

QtObject {
    id:root

    property color textColor: "#FFFFFF"
    property color charcoalGrey: "#404040" // 25%
    property color granite: "#808080" // 50%
    property color paleSlate: "#BFBFBF" // 75%
    property color lightColor4: "#000000" //100%

    property color darkColor1: "#BFBFBF" // 25%
    property color darkColor2: "#7F7F7F" // 50%
    property color darkColor3: "#404040" // 75%
    property color darkColor4: "#FFFFFF" //100%


    property color lightLime: "#A5FF5D"
    property color pastelBlue: "#96C6FF"
    property color cinder: "#151515"
    property color seashell: "#F1F1F1"

    property var fontawesomefont: fontawesome.name
    property FontLoader fontawesome: FontLoader{
        source: "qrc:/fonts/fontawesome.otf"
    }

    function alphaColor(color, alpha) {
        let actualColor = Qt.darker(color, 1)
        actualColor.a = alpha
        return actualColor
    }
}
