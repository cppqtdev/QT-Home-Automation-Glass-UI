import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import SmartHome 1.0

Switch {
    id: control

    rightPadding: 0
    indicator: Rectangle {
        implicitHeight: 32
        implicitWidth: 56
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: width / 2
        color: control.checked ? "#E4A11B" : Style.alphaColor("#FFFFFF", 0.5)

        Rectangle {
            x: control.checked ? (parent.width - width) - 2 : 2
            width: 28
            height: 28
            radius: height / 2
            color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    contentItem: Text {
        color: "#FFFFFF"
        text: control.text
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
