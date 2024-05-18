import QtQuick 2.15
import QtQuick.Controls
import SmartHome 1.0

Label {
    property real size: 24
    property string icon

    text: icon
    font.pixelSize: size
    font.family: Style.fontawesomefont
}
