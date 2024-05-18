import QtQuick
import SmartHome 1.0
Item {
    id: dateitem
    height: 150
    width: parent.width
    anchors.top: parent.top

    Text {
        text: Qt.formatDate(currentTime, 'yyyy-MM-dd')
        font.pixelSize: 16
        color: Style.textColor
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.topMargin: 24
    }

    Text {
        text: Qt.formatDate(currentTime, 'ddd')
        font.pixelSize: 16
        color: Style.textColor
        anchors.top: parent.top
        anchors.right: ampmtxt.right
        anchors.topMargin: 24
    }

    Text {
        id: timetxt
        text: Qt.formatTime(currentTime, 'hh:mm')
        font.pixelSize: 64
        color: Style.textColor
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.bottomMargin: 24
    }

    Text {
        id: sectxt
        width: 50
        text: ':' + Qt.formatTime(currentTime, 'ss')
        font.pixelSize: 24
        color: Style.textColor
        anchors.baseline: timetxt.baseline
        anchors.left: timetxt.right
    }

    Text {
        id: ampmtxt
        text: Qt.formatTime(currentTime, 'AP')
        font.pixelSize: 16
        color: Style.textColor
        anchors.baseline: timetxt.baseline
        anchors.left: sectxt.right
        anchors.leftMargin: 8
    }
}
