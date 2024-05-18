import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import SmartHome 1.0
import "../Components"

ColumnLayout {
    anchors.fill: parent
    spacing: 0
    Pane {
        Layout.fillHeight: true
        Layout.fillWidth: true
        padding: 0
        background: Rectangle {
            anchors.fill: parent
            color: "#53B79B"
        }
        contentItem: Item {
            anchors.fill: parent
            RowLayout{
                width: parent.width
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    ColumnLayout{
                        id: topLeftLayer
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 60
                        anchors.topMargin: 50
                        Rectangle {
                            width: 100
                            height: 5
                            color: Style.alphaColor("#000000",0.65)
                        }
                        Text{
                            font.pixelSize: 16
                            font.bold: Font.DemiBold
                            text: qsTr("TEMPERATURE INSIDE NOW")
                        }
                    }

                    SwipeView {
                        id: view
                        currentIndex: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 60
                        anchors.top: topLeftLayer.bottom
                        anchors.topMargin: 50
                        spacing: 20
                        clip: true

                        RowLayout{
                            clip: true
                            spacing: 70
                            OutlinedLabel {
                                icon: "\uf2dc"
                                backgroundHeight: 90
                                backgroundWidth: 90
                                radius: 45
                                iconSize: 65
                                backgroundColor: Style.alphaColor("#000000",0.25)
                                borderColor: backgroundColor
                                onClicked: {}
                            }

                            RowLayout{
                                Text{
                                    font.pixelSize: 120
                                    font.bold: Font.DemiBold
                                    text: qsTr("21")
                                    color: Style.textColor
                                }
                                Text{
                                    font.pixelSize: 120
                                    font.bold: Font.DemiBold
                                    text: qsTr("°C")
                                    color: Style.alphaColor("#000000",0.50)
                                }
                            }

                            OutlinedLabel {
                                icon: '\uf1de'
                                backgroundHeight: 48
                                backgroundWidth: 48
                                radius: 24
                                iconSize: 18
                                backgroundColor: Style.alphaColor("#000000",0.25)
                                borderColor: backgroundColor
                                onClicked: {}
                            }
                        }


                        RowLayout{
                            clip: true
                            spacing: 70
                            OutlinedLabel {
                                icon: "\uf0c2"
                                backgroundHeight: 90
                                backgroundWidth: 90
                                radius: 45
                                iconSize: 40
                                backgroundColor: Style.alphaColor("#000000",0.25)
                                borderColor: backgroundColor
                                onClicked: {}
                            }

                            RowLayout{
                                Text{
                                    font.pixelSize: 120
                                    font.bold: Font.DemiBold
                                    text: qsTr("25")
                                    color: Style.textColor
                                }
                                Text{
                                    font.pixelSize: 120
                                    font.bold: Font.DemiBold
                                    text: qsTr("°C")
                                    color: Style.alphaColor("#000000",0.50)
                                }
                            }

                            OutlinedLabel {
                                icon: '\uf1de'
                                backgroundHeight: 48
                                backgroundWidth: 48
                                radius: 24
                                iconSize: 18
                                backgroundColor: Style.alphaColor("#000000",0.25)
                                borderColor: backgroundColor
                                onClicked: {}
                            }
                        }

                        RowLayout{
                            clip: true
                            spacing: 70
                            OutlinedLabel {
                                icon: "\uf2dc"
                                backgroundHeight: 90
                                backgroundWidth: 90
                                radius: 45
                                iconSize: 65
                                backgroundColor: Style.alphaColor("#000000",0.25)
                                borderColor: backgroundColor
                                onClicked: {}
                            }

                            RowLayout{
                                Text{
                                    font.pixelSize: 120
                                    font.bold: Font.DemiBold
                                    text: qsTr("21")
                                    color: Style.textColor
                                }
                                Text{
                                    font.pixelSize: 120
                                    font.bold: Font.DemiBold
                                    text: qsTr("°C")
                                    color: Style.alphaColor("#000000",0.50)
                                }
                            }

                            OutlinedLabel {
                                icon: '\uf1de'
                                backgroundHeight: 48
                                backgroundWidth: 48
                                radius: 24
                                iconSize: 18
                                backgroundColor: Style.alphaColor("#000000",0.25)
                                borderColor: backgroundColor
                                onClicked: {}
                            }
                        }

                    }
                    PageIndicator {
                        id: indicator
                        count: view.count
                        currentIndex: view.currentIndex
                        anchors.topMargin: 20
                        anchors.top: view.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    RowLayout{
                        id: topLayer
                        width: parent.width
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 50
                        anchors.topMargin: 50

                        spacing: 30

                        OutlinedLabel {
                            icon: '\uf0fe'
                            iconSize: 18
                            backgroundColor: Style.alphaColor("#000000",0.25)
                            borderColor: backgroundColor
                            onClicked: {}
                        }

                        ColumnLayout{
                            width: parent.width
                            Rectangle {
                                width: 100
                                height: 5
                                color: Style.alphaColor("#000000",0.65)
                            }
                            Text{
                                font.pixelSize: 16
                                font.bold: Font.DemiBold
                                text: qsTr("NEXT SCHEDULED EVENT")
                            }
                        }

                        Item{ Layout.fillWidth: true }

                        OutlinedLabel {
                            icon: '\uf0fe'
                            iconSize: 18
                            backgroundColor: Style.alphaColor("#000000",0.25)
                            borderColor: backgroundColor
                            onClicked: {}
                        }

                        Item{ Layout.preferredWidth: 100 }
                    }

                    Column{
                        spacing: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 50
                        anchors.top: topLayer.bottom
                        anchors.topMargin: 50

                        Text{
                            font.pixelSize: 48
                            font.bold: Font.DemiBold
                            text: qsTr("Today")
                            color: Style.alphaColor("#000000",0.50)
                        }
                        RowLayout{
                            Text{
                                font.pixelSize: 88
                                font.bold: Font.DemiBold
                                text: qsTr("7:30")
                                color: Style.textColor
                            }
                            Text{
                                font.pixelSize: 48
                                font.bold: Font.DemiBold
                                text: qsTr("PM")
                                color: Style.alphaColor("#000000",0.50)
                            }
                        }

                        Item { Layout.preferredHeight: 50 }

                        Text{
                            font.pixelSize: 32
                            font.bold: Font.DemiBold
                            text: qsTr("Full System Check")
                            color: Style.textColor
                        }
                    }
                }
            }
        }
    }
    Pane {
        Layout.preferredHeight: 180
        Layout.fillWidth: true
        padding: 0
        background: Rectangle {
            color: Style.alphaColor("#000000",0.65)
        }
    }
}

