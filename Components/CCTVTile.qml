import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtMultimedia
import SmartHome 1.0
import "."

Rectangle {
    id: control

    property bool on: false
    property string icon: '\uf1eb'
    property string cctv: "\uf030"
    property color iconColor: "#e7e7e9"
    property string title: qsTr("Smart Lamp")
    property string subTitle: qsTr("Living Room")
    property string tag: qsTr("Wi-Fi")

    width: 160
    height: 160
    radius: 14
    color: Style.alphaColor("#000000",0.5)

    Rectangle{
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        visible: control.on
        color: Style.granite
        width: contentLive.implicitWidth + 10
        height: 16
        radius: 8

        RowLayout{
            id: contentLive
            anchors.centerIn: parent
            Rectangle{
                color: "Red"
                width: 6
                height: 6
                radius: 6
            }

            Text {
                text: "Live"
                font.pixelSize: 8
                color: Style.alphaColor("#000000",0.6)
            }
        }
    }

    PrefsSwitch {
        id: switchOn
        checked: control.on
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        onToggled: control.on = !control.on
    }

    MediaDevices {
        id: mediaDevices
    }

    CaptureSession {
        camera: Camera {
            cameraDevice: mediaDevices.defaultVideoInput
        }
    }

    ColumnLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        IconLabel {
            visible: !control.on
            Layout.leftMargin: 10
            size: 42
            icon: control.cctv
            color: control.iconColor
            opacity: switchOn.checked ? 1 : 0.5
        }

        Text {
            text: control.title
            font.pixelSize: 16
            font.bold: Font.DemiBold
            color: "#FFFFFF"
        }

        Text {
            text: control.subTitle
            font.pixelSize: 12
            color: Style.alphaColor("#FFFFFF",0.9)
        }

        Rectangle{
            visible: !control.on
            color: Style.granite
            width: content.implicitWidth + 10
            height: 18
            radius: 8
            RowLayout{
                id: content
                anchors.centerIn: parent
                IconLabel {
                    size: 8
                    icon: control.icon
                    color: Style.alphaColor("#000000",0.6)
                }
                Text {
                    text: control.tag
                    font.pixelSize: 8
                    color: Style.alphaColor("#000000",0.6)
                }
            }
        }
    }
}

