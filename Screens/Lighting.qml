import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import SmartHome 1.0
import "../Components"
import "../Models"

Pane {
    padding: 0
    background: Rectangle {
        color: Style.alphaColor("#000000",0.2)
    }

    contentItem: Item {
        anchors.fill: parent

        GridView {
            anchors.fill: parent
            anchors.margins: 40
            flow: Grid.TopToBottom
            model: LightingModel{}
            cellWidth: 160 + 40
            cellHeight: 160 + 40
            delegate: LightingTile{
                on: model.on
                icon: model.icon
                iconColor: model.iconColor
                title: model.title
                subTitle: model.subTitle
                tag: model.tag
            }
        }
    }
}
