import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import SmartHome 1.0
import "../Components"
TabButton{
    id: control
    property string textIcon
    display: AbstractButton.TextUnderIcon
    background: Rectangle {
        color: Color.blend(parent.checked ?  "#53B79B" : Style.alphaColor("#000000",0.55),
                           parent.palette.mid, parent.down ? 0.5 : 0.0)
    }

    contentItem: Item {
        Column {
            anchors.fill: parent
            spacing: 8

            IconLabel {
                id: iconlabel
                text: control.textIcon
                width: parent.height * 0.5
                height: width
                color: Style.textColor
                topPadding: 10
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: IconLabel.AlignHCenter
                verticalAlignment: IconLabel.AlignVCenter
                opacity: control.checked ? 1 : 0.5

                Behavior on opacity { NumberAnimation { duration: 300 }}
            }

            Text {
                text: control.text
                font.pixelSize: 12
                color: Style.textColor
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: control.checked  ? 1 : 0.5

                Behavior on opacity { NumberAnimation { duration: 300 }}
            }
        }
    }
}
