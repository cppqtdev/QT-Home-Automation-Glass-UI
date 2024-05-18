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

    Item {
        anchors.fill: parent
        anchors.margins: 50

        LeftPane { id: leftItem }

        MiddlePane { id: middleItem }

        RightPane { id: rightItem }
    }
}
