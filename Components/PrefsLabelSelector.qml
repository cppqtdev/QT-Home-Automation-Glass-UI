import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.impl
import SmartHome 1.0
Pane{
    id:control
    property real radius: 4
    property int allowMaxTags: 5
    property var lableList: ["ON","OFF"]

    implicitWidth: layout.implicitWidth + 8
    implicitHeight: 46
    padding: 8
    horizontalPadding: padding
    spacing: 6

    background: Rectangle{
        color: Style.alphaColor("#E0DFFE",0.6)
        radius: control.implicitHeight/2
    }

    contentItem: Item{
        anchors.fill: parent
        RowLayout{
            id:layout
            anchors.centerIn: parent

            Repeater {
                id:rep
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                width: parent.width
                model: lableList

                delegate: RadioButton {
                    id: labelIndicator
                    Layout.alignment: Qt.AlignVCenter
                    checked: index === 0
                    indicator: null
                    text: modelData

                    background: Rectangle{
                        border.color: color
                        color: checked ? "#F4F3F3" : "#00000000"
                        radius: control.implicitHeight/2
                        Rectangle {
                            id: indicator
                            property int mx
                            property int my
                            x: mx - width / 2
                            y: my - height / 2
                            height: width
                            radius: width / 2
                            color: Qt.lighter("#B8FF01")
                        }
                    }

                    ParallelAnimation {
                        id: anim
                        NumberAnimation {
                            target: indicator
                            property: 'width'
                            from: 0
                            to: labelIndicator.width * 1.5
                            duration: 200
                        }
                        NumberAnimation {
                            target: indicator;
                            property: 'opacity'
                            from: 0.9
                            to: 0
                            duration: 200
                        }
                    }

                    MouseArea {
                        id: mouseArea
                        hoverEnabled: true
                        acceptedButtons: Qt.NoButton
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                    }

                    onPressed: {
                        indicator.mx = mouseArea.mouseX
                        indicator.my = mouseArea.mouseY
                        anim.restart();
                    }

                    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                            implicitContentWidth + leftPadding + rightPadding)
                    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                             implicitContentHeight + topPadding + bottomPadding) - 5

                    leftPadding: 16
                    rightPadding: 16
                    topPadding: 14
                    bottomPadding: 14

                    spacing: 6
                    font.family: "Arial"
                    font.pixelSize: 15
                    font.bold: Font.DemiBold

                    contentItem: IconLabel {
                        spacing: labelIndicator.spacing
                        mirrored: labelIndicator.mirrored
                        display: labelIndicator.display
                        icon: labelIndicator.icon
                        text: modelData
                        font: labelIndicator.font
                        color: "#000000"
                    }
                }
            }
        }
    }
}
