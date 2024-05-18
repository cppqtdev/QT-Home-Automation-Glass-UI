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

    QtObject {
        id: sliderProperties

        property int trackWidth: 20
        property int progressWidth: 20
        property int handleWidth: 22
        property int handleHeight: 22
        property int handleRadius: 11
        property int handleVerticalOffset: 0

        property real startAngle: 0
        property real endAngle: 360
        property real minValue: 0
        property real maxValue: 100

        property color trackColor: "#505050"
        property color progressColor: "#3a4ec4"
        property color handleColor: "#fefefe"

        property bool snap: false
        property real stepSize: 10
        property bool hideTrack: false
        property bool hideProgress: false
    }

    contentItem: Item {
        anchors.fill: parent

        Grid {
            anchors.centerIn: parent
            anchors.margins: 10
            columns: 2
            flow: Grid.TopToBottom
            spacing: 20
            horizontalItemAlignment: Grid.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter

            Tile {
                visible: false
                title: qsTr("Kitchen")
                source: "qrc:/assets/others/Ellipse 44.png"
                Layout.alignment: Qt.AlignHCenter

                RowLayout{
                    anchors.centerIn: parent
                    IconImage {
                        isTextIcon: true
                        icon: "\uf0eb"
                    }

                    IconImage {
                        isTextIcon: true
                        icon: "\uf2dc"
                    }
                    IconImage {
                        isTextIcon: true
                        icon: "\uf2cc"
                    }

                    IconImage {
                        isTextIcon: true
                        icon: "\ue51a"
                    }
                    IconImage {
                        isTextIcon: true
                        icon: "\uf236"
                    }
                    IconImage {
                        text : qsTr("Min")
                    }
                }
            }

            Tile {
                visible: false
                title: qsTr("Bedroom")
                source: "qrc:/assets/others/Ellipse 47.png"
                Layout.alignment: Qt.AlignHCenter
                CircularSlider {
                    id: circularSlider
                    anchors.centerIn: parent

                    width: parent.height * 0.8
                    height: parent.height * 0.8

                    trackWidth: sliderProperties.trackWidth
                    progressWidth: sliderProperties.progressWidth
                    handleWidth: sliderProperties.handleWidth
                    handleHeight: sliderProperties.handleHeight
                    handleRadius: sliderProperties.handleRadius
                    handleVerticalOffset: sliderProperties.handleVerticalOffset

                    startAngle: sliderProperties.startAngle
                    endAngle: sliderProperties.endAngle
                    minValue: sliderProperties.minValue
                    maxValue: sliderProperties.maxValue
                    snap: sliderProperties.snap
                    stepSize: 5
                    value: 10

                    handleColor: sliderProperties.handleColor
                    trackColor: sliderProperties.trackColor
                    progressColor: sliderProperties.progressColor

                    hideTrack: sliderProperties.hideTrack
                    hideProgress: sliderProperties.hideProgress

                }
            }

            Tile {
                 visible: false
                id: roomTile
                title: qsTr("Room")
                source: "qrc:/assets/others/Ellipse 45.png"
                Layout.alignment: Qt.AlignHCenter

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 20

                    Row {
                        Layout.fillWidth: true
                        spacing: 30

                        CircularSlider {
                            id: progressIndicator
                            hideProgress: true
                            hideTrack: true
                            width: roomTile.height * 0.7
                            height: roomTile.height * 0.7

                            interactive: false
                            value: inputSlider.value

                            Repeater {
                                model: 72

                                Rectangle {
                                    id: indicator
                                    width: 4
                                    height: 16
                                    radius: width / 2
                                    color: indicator.angle > progressIndicator.angle ? "#16171C" : "#7CFF6E"
                                    readonly property real angle: index * 5
                                    transform: [
                                        Translate {
                                            x: progressIndicator.width / 2 - width / 2
                                        },
                                        Rotation {
                                            origin.x: progressIndicator.width / 2
                                            origin.y: progressIndicator.height / 2
                                            angle: indicator.angle
                                        }
                                    ]
                                }
                            }
                        }
                    }

                    Slider {
                        id: inputSlider
                        from: 0.0
                        to: 1.0
                        Layout.fillWidth: true
                    }
                }

            }

            Tile {
                id: securityTile
                title: qsTr("Fault Alert")
                source: "qrc:/assets/others/Ellipse 46.png"
                Layout.alignment: Qt.AlignHCenter

                PrefsLabelSelector {
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                CircularSlider {
                    id: progressIndicator3
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10

                    hideProgress: true
                    hideTrack: true
                    width: securityTile.height * 0.45
                    height: securityTile.height * 0.45
                    interactive: false
                    value: faultSlider.value / 100

                    Repeater {
                        model: 18
                        Rectangle {
                            id: indicator3
                            width: 10
                            height: 10
                            radius: width / 2
                            color: indicator3.angle > progressIndicator3.angle ? "#16171C" : "#FFA500"
                            readonly property real angle: index * 20
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
                        Image {
                            Layout.alignment: Qt.AlignHCenter
                            source: "qrc:/assets/icons/fault.svg"
                            sourceSize: Qt.size(32,32)
                        }

                        Image {
                            Layout.alignment: Qt.AlignHCenter
                            sourceSize: Qt.size(22,22)
                            source: "qrc:/assets/icons/faultindi.svg"
                        }
                    }
                }

                ColumnLayout{
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    spacing: 10

                    ColumnLayout{
                        width: parent.width
                        spacing: 0
                        RowLayout{
                            width: parent.width
                            Item {
                                Layout.preferredWidth: 150
                            }

                            PrefsSlider {
                                id: faultSlider
                                Layout.alignment: Qt.AlignHCenter
                                toolTipVisible: true
                                Layout.fillWidth: true
                                from: 0
                                to: 100
                                value: 76
                            }

                            Item {
                                Layout.preferredWidth: 150
                            }
                        }

                        PrefsLabel {
                            Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Scanning in progress")
                        }
                    }

                    RowLayout{
                        width: parent.width

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
            }
        }
    }
}

