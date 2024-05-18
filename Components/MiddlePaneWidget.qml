import QtQuick
import QtQuick.Layouts
import SmartHome 1.0
Rectangle {
    id: root
    color: glassyBgColor
    radius: 16

    Layout.fillWidth: true
    Layout.fillHeight: true

    property string label
    property real value
    property string units
    property bool alignUnitsRight: true

    Item {
        anchors.fill: parent
        anchors.margins: 24

        Text {
            text: label
            font.pixelSize: 14
            color: Style.textColor
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Text {
            id: valuetxt
            text: value
            font.pixelSize: 56
            color: Style.textColor
            anchors.bottom: parent.bottom
            anchors.bottomMargin: alignUnitsRight ? 0 : 16
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: units
                font.pixelSize: 16
                color: Style.textColor
                anchors.top: parent.top
                anchors.left: parent.right
                visible: alignUnitsRight
            }
        }

        Text {
            text: units
            font.pixelSize: 16
            color: Style.textColor
            visible: !alignUnitsRight
            anchors.top: valuetxt.bottom
            anchors.right: valuetxt.right
        }
    }
}
