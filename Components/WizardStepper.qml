import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import SmartHome 1.0

import "."

Item {
    id: root
    width: parent.width
    height: 45
    property ListModel stepsModel: ListModel { }

    ListView {
        id: repeat
        width: childrenRect.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        orientation: ListView.Horizontal
        interactive : false
        model: stepsModel

        spacing: 2
        delegate: RowLayout {
            id: delegate
            height: root.height
            spacing: repeat.spacing

            Rectangle {
                id: icon
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                width: root.height
                height: root.height
                radius: width/2

                color: stepCompleted ? "#00000000" : Style.charcoalGrey
                border.color: Style.charcoalGrey
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    visible: !stepCompleted
                    text: index+1
                    font.pixelSize: 17
                    color: Style.textColor
                }

                IconLabel {
                    anchors.centerIn: parent
                    visible: stepCompleted
                    icon: "\uf00c"
                    size: 18
                    color: Style.textColor
                }
            }

            Rectangle {
                id: line
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                Layout.preferredWidth: root.height
                height: visible ? 2 : 0

                visible: (index !== repeat.count - 1)
                color: Style.charcoalGrey
                radius: 5
            }
        }
    }
}
