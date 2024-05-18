import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import SmartHome 1.0
import "Components"
import "Screens"

Page {
    padding: 0
    background: null

    TimeShow {
        id: dateitem
        anchors.left: parent.left
        anchors.leftMargin: 50
    }

    footer: RowLayout {
        Layout.fillWidth: true
        width: parent.width
        height: 600

        Item{ Layout.preferredWidth: 50 }

        Rectangle {
            width: 325
            height: 500
            color: Style.alphaColor("#000000",0.5)
            border.color: Style.alphaColor("#FFFFFF",0.25)
            radius: 24

            ColumnLayout{
                width: parent.width
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Air Conditioner")
                    }

                    PrefsSwitch{
                        checked: true
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        font.pixelSize: 28
                        text: qsTr("18 °C")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        backgroundWidth: 42
                        radius: 8
                        iconSize: 32
                        icon: '\uf0d8' //caret-up
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        onClicked: {}
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        color: Style.alphaColor("#FFFFFF",0.25)
                        text: qsTr("Current temperature")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        backgroundWidth: 42
                        radius: 8
                        iconSize: 32
                        icon: '\uf0d7' //caret-down
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        onClicked: {}
                    }

                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Mode")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "Cold"
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Auto turn on")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "10:00 PM"
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Auto turn off")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "4:00 AM"
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Wind")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "Medium"
                    }
                }
            }
        }

        Item{ Layout.fillWidth: true }

        ColumnLayout{
            spacing: 20
            Rectangle {
                width: 325
                height: 120
                color: Style.alphaColor("#000000",0.5)
                border.color: Style.alphaColor("#FFFFFF",0.25)
                radius: 24

                RowLayout{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20

                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Air Purifier")
                    }

                    PrefsSwitch{}
                }
            }
            Rectangle {
                width: 325
                height: 210
                color: Style.alphaColor("#000000",0.5)
                border.color: Style.alphaColor("#FFFFFF",0.25)
                radius: 24

                ColumnLayout{
                    width: parent.width
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20

                    RowLayout{
                        PrefsLabel{
                            Layout.fillWidth: true
                            text: qsTr("Sony Smart TV")
                        }

                        PrefsSwitch{
                            checked: true
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }

                    RowLayout{
                        width: parent.width
                        ListView{
                            clip: true
                            width: parent.width * 0.53
                            height: 52
                            model: ListModel {
                                ListElement { source: "qrc:/assets/spotify-client.svg" }
                                ListElement { source: "qrc:/assets/youtube-to-mp3.svg" }
                                ListElement { source: "qrc:/assets/brasero.svg" }
                                ListElement { source: "qrc:/assets/itunes.svg" }
                                ListElement { source: "qrc:/assets/brave-browser.svg" }
                                ListElement { source: "qrc:/assets/youtube.svg" }
                            }
                            orientation: Qt.Horizontal
                            spacing: 10
                            delegate: Image{
                                width: 48
                                height: 48
                                clip: true
                                source: model.source
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        OutlinedLabel {
                            icon: '\uf0fe'
                            iconSize: 18
                            backgroundColor: Style.charcoalGrey
                            borderColor: Style.charcoalGrey
                            onClicked: {}
                        }
                    }
                }
            }
            Rectangle {
                width: 325
                height: 130
                color: Style.alphaColor("#000000",0.5)
                border.color: Style.alphaColor("#FFFFFF",0.25)
                radius: 24
                ColumnLayout{
                    width: parent.width
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20

                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Window Curtains")
                    }

                    Item { Layout.fillHeight: true }

                    RowLayout{
                        spacing: 10
                        PrefsLabel{
                            font.pixelSize: 18
                            text: qsTr("Opened")
                        }

                        PrefsSlider{
                            id: windowSlider
                            Layout.fillWidth: true
                            from: 0
                            to: 100
                            value: 68
                        }

                        PrefsLabel{
                            font.pixelSize: 18
                            text: windowSlider.value.toFixed(0) +" %"
                        }
                    }

                }

            }
        }

        Item{ Layout.fillWidth: true }

        Rectangle {
            width: 325
            height: 350
            color: Style.alphaColor("#000000",0.5)
            border.color: Style.alphaColor("#FFFFFF",0.25)
            radius: 24
            Layout.alignment: Qt.AlignBottom
            Layout.bottomMargin: 50
            ColumnLayout{
                width: parent.width
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                PrefsLabel{
                    Layout.fillWidth: true
                    text: qsTr("Shreya’s Echo Dot")
                }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        color: Style.alphaColor("#FFFFFF",0.25)
                        text: qsTr("Mute")
                    }

                    PrefsSwitch{
                        checked: true
                    }
                }

                PrefsLabel{
                    Layout.fillWidth: true
                    color: Style.alphaColor("#FFFFFF",0.25)
                    text: qsTr("Now playing 🎧")
                }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Lose You To Love Me....")
                    }

                    Image{
                        width: 38
                        height: 38
                        clip: true
                        source: "qrc:/assets/spotify-client.svg"
                    }
                }

                RowLayout{
                    spacing: 10

                    OutlinedLabel {
                        radius: 10
                        backgroundHeight: 42
                        backgroundWidth: 42
                        iconSize: 32
                        icon: '\uf0d9' //caret-left
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        onClicked: {}
                    }

                    OutlinedLabel {
                        radius: 10
                        backgroundHeight: 42
                        backgroundWidth: 42
                        property bool isPlay: false
                        icon: isPlay ? '\uf04b' /* play */ : '\uf04c' /* pause */
                        iconSize: 18
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        onClicked: {}
                    }

                    OutlinedLabel {
                        radius: 10
                        backgroundHeight: 42
                        backgroundWidth: 42
                        iconSize: 32
                        icon: '\uf0da' //caret-right
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        onClicked: {}
                    }
                }

                RowLayout{
                    spacing: 10
                    PrefsLabel{
                        font.pixelSize: 18
                        text: qsTr("Volume")
                    }

                    PrefsSlider{
                        id: valume
                        Layout.fillWidth: true
                        from: 0
                        to: 100
                        value: 68
                    }

                    PrefsLabel{
                        font.pixelSize: 18
                        text: valume.value.toFixed(0) +" %"
                    }
                }
            }
        }

        Item{ Layout.fillWidth: true }

        Rectangle {
            width: 325
            height: 430
            color: Style.alphaColor("#000000",0.5)
            border.color: Style.alphaColor("#FFFFFF",0.25)
            radius: 24
            Layout.alignment: Qt.AlignBottom
            Layout.bottomMargin: 50

            ColumnLayout{
                width: parent.width
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Ambient lights")
                    }

                    PrefsSwitch{}
                }
                Item { Layout.fillHeight: true }

                RowLayout{
                    spacing: 10
                    PrefsLabel{
                        font.pixelSize: 18
                        text: qsTr("Brightness")
                    }

                    PrefsSlider{
                        id: brightness
                        Layout.fillWidth: true
                        from: 0
                        to: 100
                        value: 68
                    }

                    RowLayout{
                        spacing: 2
                        PrefsLabel{
                            font.pixelSize: 18
                            text: brightness.value.toFixed(0) +" %"
                        }

                        IconLabel {
                            icon: '\uf185'
                            size: 24
                            color: '#FFFFFF'
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Colour")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "White"
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Scene")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "Gorgeous"
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Schedule")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "Setup"
                    }
                }

                Item { Layout.fillHeight: true }

                RowLayout{
                    PrefsLabel{
                        Layout.fillWidth: true
                        text: qsTr("Music Sync")
                    }

                    OutlinedLabel {
                        backgroundHeight: 42
                        radius: 8
                        backgroundColor: Style.charcoalGrey
                        borderColor: Style.charcoalGrey
                        text : "Off"
                    }
                }
            }
        }

        Item{ Layout.preferredWidth: 50 }

    }

}
