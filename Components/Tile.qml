import QtQuick 2.15
import QtQuick.Controls
import SmartHome 1.0

Pane {
    id:root

    property string source: "qrc:/assets/others/Ellipse 46.png"
    property string title

    padding: 0
    width: 701
    height: 265

    background: Rectangle {
        anchors.fill: parent
        color: "#00000000"//Style.alphaColor("#000000",0.5)
        radius: 18

        Text {
            text: root.title
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 5

            font.pixelSize: 24
            font.bold: Font.DemiBold
            color: Style.seashell
        }
    }

    Image{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        source: root.source
        fillMode: Image.PreserveAspectFit
    }

    Image{
        id: pallet
        source: "qrc:/assets/others/Subtract.svg"
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }
}
