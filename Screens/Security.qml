import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import SmartHome 1.0
import "../Components"

Pane {
    id: securityTile
    padding: 0
    background: Rectangle {
        color: Style.alphaColor("#000000",0.65)
    }

    PrefsLabelSelector {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    PrefsLabel {
        text: qsTr("Fault Alert")
        font.bold: Font.DemiBold
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
    }


    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        PrefsLabel {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Scanning for Faults")
            font.bold: Font.DemiBold
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            width: 250
            height: 2
            color: "#FFB800"
            radius: 10
        }
    }

    CircularSlider {
        id: progressIndicator3
        anchors.centerIn: parent

        hideProgress: true
        hideTrack: true
        width: securityTile.height * 0.35
        height: securityTile.height * 0.35
        interactive: false
        value: faultSlider.value / 100

        Repeater {
            model: 36
            Rectangle {
                id: indicator3
                width: 10
                height: 10
                radius: width / 2
                color: indicator3.angle > progressIndicator3.angle ? Style.alphaColor("#E0DFFE",0.6) : "#FFA500"
                readonly property real angle: index * 10
                transform: [
                    Translate {
                        x: progressIndicator3.width / 2 - width / 2
                    },
                    Rotation {
                        origin.x: progressIndicator3.width / 2
                        origin.y: progressIndicator3.height / 2
                        angle: indicator3.angle
                    }
                ]
            }
        }

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10
            Image {
                Layout.alignment: Qt.AlignHCenter
                source: "qrc:/assets/icons/fault.svg"
            }

            Image {
                Layout.alignment: Qt.AlignHCenter
                source: "qrc:/assets/icons/faultindi.svg"
            }
        }
    }


    ColumnLayout{
        id: progress
        Layout.alignment: Qt.AlignHCenter
        anchors.top: progressIndicator3.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0

        PrefsSlider {
            id: faultSlider
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: securityTile.width * 0.6
            toolTipVisible: true
            from: 0
            to: 100
            value: 76
        }

        PrefsLabel {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Scanning in progress")
        }
    }

    RowLayout{
        width: parent.width
        anchors.horizontalCenter: progressIndicator3.horizontalCenter
        anchors.top: progress.bottom
        anchors.topMargin: 40

        EffectButton{
            iconWidth: 24
            iconHeight: 24
            implicitHeight: 48
            implicitWidth: 48
            Layout.alignment: Qt.AlignHCenter
            iconBackground: "#00FF19"
            roundIcon: true
            checkable: true
            setIcon:"qrc:/assets/wrench.svg"
            onClicked: {}
        }

        EffectButton{
            iconWidth: 22
            iconHeight: 22
            implicitHeight: 48
            implicitWidth: 48
            Layout.alignment: Qt.AlignHCenter
            iconBackground: "#FFB800"
            roundIcon: true
            checkable: true
            setIcon:"qrc:/assets/reload.svg"
            onClicked: {}
        }

        EffectButton{
            implicitHeight: 48
            implicitWidth: 48
            Layout.alignment: Qt.AlignHCenter
            iconBackground: "#FF0000"
            roundIcon: true
            checkable: true
            setIcon:"qrc:/assets/🦆 icon _flash_.svg"
            onClicked: {}
        }
    }
}
