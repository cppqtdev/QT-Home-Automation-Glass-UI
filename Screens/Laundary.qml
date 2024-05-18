import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import SmartHome 1.0
import "../Components"

Page {
    padding: 0
    background: null

    header: RowLayout{
        width: parent.width
        spacing: 0
        Rectangle{
            Layout.preferredWidth: parent.width * 0.2
            height: 50
            color: Style.alphaColor("#000000",0.55)

            RowLayout{
                anchors.centerIn: parent
                spacing: 10
                Text{
                    id: currentTime
                    text: qsTr("03:20 PM")
                    font.pixelSize: 16
                    font.bold: Font.Bold
                    font.weight: Font.Medium
                    color: Style.textColor
                }

                Text{
                    id: currentDate
                    text: qsTr("12 May 2024")
                    font.pixelSize: 16
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    color: Style.textColor
                }
            }
        }
        Rectangle{
            Layout.fillWidth: true
            height: 50
            color: Style.alphaColor("#000000",0.25)
            RowLayout{
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 10

                IconLabel {
                    icon: '\uf0f3'
                    size: 18
                    color: '#FFFFFF'
                }

                Text{
                    id: notificationMessage
                    text: qsTr("You have got %1 new alert").arg(1)
                    font.pixelSize: 16
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    color: Style.textColor
                }

                Item{ Layout.fillWidth: true }

                IconLabel {
                    icon: '\uf130'
                    size: 18
                    color: '#FFFFFF'
                }

                Item{ Layout.preferredWidth: 30 }
            }
        }
    }

    Loader{
        id: pageLoader
        anchors.fill: parent
        sourceComponent: dashboard
    }

    footer: RowLayout{
        width: parent.width
        height: 70
        spacing: 0
        anchors.bottom: parent.bottom
        PrefsTabButton{
            id: adhasboar
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf015'
            text: qsTr("Dashboard")
            checked: true
            onClicked: pageLoader.sourceComponent = dashboard
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf76b'
            text: qsTr("Air Conditioner")
            onClicked: pageLoader.sourceComponent = airConditioner
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf0eb'
            text: qsTr("Lighting")
            onClicked: pageLoader.sourceComponent = lighting
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf3fa'
            text: qsTr("Applications")
            onClicked: pageLoader.sourceComponent = application
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf1e4'
            text: qsTr("Communications")
            onClicked: pageLoader.sourceComponent = communications
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf3ed'
            text: qsTr("Security")
            onClicked: pageLoader.sourceComponent = security
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf030'
            text: qsTr("CCTV")
            onClicked: pageLoader.sourceComponent = cctv
        }
        PrefsTabButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            textIcon: '\uf013'
            text: qsTr("Settings")
            onClicked: pageLoader.sourceComponent = settings
        }
    }

    Component{
        id: dashboard
        Dashboard{}
    }

    Component{
        id: airConditioner
        AirConditioner{}
    }

    Component{
        id: lighting
        Lighting{}
    }

    Component{
        id: application
        Applications{}
    }

    Component{
        id: communications
        Communications{}
    }

    Component{
        id: settings
        Settings{}
    }

    Component{
        id: security
        Security{}
    }
    Component{
        id: cctv
        CCTV{}
    }
}
