import QtQuick
import QtQuick.Controls

ProgressBar {
    id: control
    value: 0.5
    height: 16

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 6
        color: "#494F56"
        radius: height/2
    }

    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 4

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            radius: height/2
            color: "#6CE5E8"
        }
    }
}
