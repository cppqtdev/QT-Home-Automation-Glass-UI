import QtQuick
import QtQuick.Layouts
import SmartHome 1.0
RowLayout {
    width: parent.width
    height: 20

    property string label
    property alias checked: _switch.checked

    Text {
        text: label
        font.pixelSize: 14
        color: Style.textColor
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignVCenter
    }

    PrefsSwitch {
        id: _switch
        checked: true
        Layout.alignment: Qt.AlignVCenter
    }
}
