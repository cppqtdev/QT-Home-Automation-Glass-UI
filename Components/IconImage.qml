import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.impl 2.12 as Impl
import Qt5Compat.GraphicalEffects
import SmartHome 1.0

import "."
Pane {
    id: control

    property color color: isTextIcon ? "#000000" : Style.textColor
    property color backgroundColor: icon ? Style.textColor : "#0D0D0D"
    property color borderColor: "#00000000"
    property string text
    property real radius: icon ? backgroundHeight/2 : 10
    property string icon
    property int iconSize: 18
    property real backgroundHeight: icon ? 42 : 38
    property real backgroundWidth: icon ? 42 : 38
    property bool isTextIcon: false

    signal clicked()

    visible: text || icon
    font.pixelSize: 20
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    horizontalPadding: {
        if(icon) {
            return padding
        }
        return padding + 8
    }

    padding: 6
    spacing: 6

    background: Rectangle{
        implicitWidth: control.backgroundWidth
        implicitHeight: control.backgroundHeight
        radius: control.radius
        color: control.backgroundColor
        border.color: control.borderColor
    }

    contentItem: {
        if(isTextIcon) {
            return textIconOnly.createObject()
        } else if(icon) {
            return iconOnly.createObject()
        }
        return textOnly.createObject()
    }

    Component {
        id: textOnly
        Impl.IconLabel {
            opacity: 1
            text: control.text
            font: control.font
            color: control.color
            display: AbstractButton.TextOnly
            spacing: control.spacing
            mirrored: control.mirrored
        }
    }

    Component {
        id: iconOnly
        Image {
            anchors.centerIn: parent
            source: control.icon
            sourceSize: Qt.size(control.iconSize,control.iconSize)

            MouseArea {
                id: sensor
                anchors.fill: parent
                onClicked: {
                    control.clicked()
                }
            }
        }
    }


    Component {
        id: textIconOnly
        IconLabel {
            icon: control.icon
            size: control.iconSize
            color: control.color
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter

            MouseArea {
                id: sensor
                anchors.fill: parent
                onClicked: {
                    control.clicked()
                }
            }
        }
    }
}
