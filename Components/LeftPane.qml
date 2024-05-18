import QtQuick
import SmartHome 1.0
Item {
    id: leftItem
    width: 370
    height: parent.height
    anchors.left: parent.left

    TimeShow {
        id: dateitem
    }

    Rectangle {
        id: todaysweatheritem
        radius: 16
        width: parent.width
        color: glassyBgColor
        anchors.top: dateitem.bottom
        anchors.bottom: locationitem.top
        anchors.topMargin: 17
        anchors.bottomMargin: 17

        Text {
            text: qsTr('Today')
            font.pixelSize: 14
            color: Style.textColor
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 24
        }

        Column {
            anchors.centerIn: parent
            spacing: 24

            Row {
                spacing: 24
                height: tmptxt.height
                anchors.horizontalCenter: parent.horizontalCenter

                IconLabel {
                    id: cloudicon
                    icon: '\uf746'
                    size: 24
                    color: Style.textColor
                    anchors.baseline: tmptxt.baseline
                }

                Text {
                    id: tmptxt
                    text: ambientTemperature
                    font.pixelSize: 82
                    color: Style.textColor

                    Text {
                        text: qsTr('°C')
                        font.pixelSize: 12
                        color: Style.textColor
                        anchors.top: parent.top
                        anchors.left: parent.right
                    }
                }

                Text {
                    id: minmaxtxt
                    text: qsTr('24/16')
                    font.pixelSize: 14
                    color: Style.textColor
                    anchors.baseline: tmptxt.baseline
                }
            }

            Text {
                id: weathercommentxt
                text: qsTr('Partially Clouded')
                font.pixelSize: 16
                color: Style.textColor
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Rectangle {
        id: locationitem
        radius: 16
        height: 126
        color: glassyBgColor
        width: parent.width
        anchors.bottom: parent.bottom

        Row {
            id: locationitempadded
            anchors.fill: parent
            anchors.margins: 24

            Repeater {
                id: locationrepeater
                model: roomsModel

                delegate: Item {
                    id: roomdelegateitem
                    height: locationitempadded.height
                    width: locationitempadded.width / locationrepeater.model.count

                    property string label
                    property bool isActive: label===activeRoomLabel
                    property alias icon: iconlabel.icon
                    property alias size: iconlabel.size

                    signal clicked()

                    label: model.label
                    icon: model.icon
                    size: model.size
                    onClicked: activeRoomLabel=label

                    Column {
                        anchors.fill: parent
                        spacing: 8

                        IconLabel {
                            id: iconlabel
                            width: parent.height * 0.5
                            height: width
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: IconLabel.AlignHCenter
                            verticalAlignment: IconLabel.AlignVCenter
                            opacity: roomdelegateitem.isActive ? 1 : 0.5
                            color: Style.textColor
                            Behavior on opacity { NumberAnimation { duration: 300 }}
                        }

                        Text {
                            text: roomdelegateitem.label
                            font.pixelSize: 12
                            color: Style.textColor
                            anchors.horizontalCenter: parent.horizontalCenter
                            opacity: roomdelegateitem.isActive ? 1 : 0.5

                            Behavior on opacity { NumberAnimation { duration: 300 }}

                            Rectangle {
                                width: parent.parent.width * 0.8
                                height: 4
                                radius: 2
                                color: Style.textColor
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: -8
                                opacity: roomdelegateitem.isActive ? 1 : 0.5

                                Behavior on opacity { NumberAnimation { duration: 300 }}
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: roomdelegateitem.clicked()
                    }
                }
            }
        }
    }
}
