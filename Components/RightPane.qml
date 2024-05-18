import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import SmartHome 1.0
Item {
    id: rightItem
    height: parent.height
    anchors.left: middleItem.right
    anchors.right: parent.right
    anchors.leftMargin: 35

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        Rectangle {
            color: glassyBgColor
            radius: 16
            Layout.fillWidth: true
            Layout.preferredHeight: 200

            Item {
                anchors.fill: parent
                anchors.margins: 24

                PrefsCircularProgressBar {
                    width: 190
                    height: 190
                    anchors.centerIn: parent
                    knobBackgroundColor: '#48709F'
                    knobColor: '#5CE1E6'
                    from: 0
                    to: 100
                    value: 50
                    lineWidth: 16

                    Item {
                        anchors.fill: parent
                        anchors.margins: 16

                        Text {
                            text: commafy(powerConsumed)
                            font.pixelSize: 36
                            color: Style.textColor
                            anchors.centerIn: parent

                            Text {
                                text: qsTr('Power')
                                font.pixelSize: 16
                                color: Style.textColor

                                anchors.bottom: parent.top
                                anchors.bottomMargin: 8
                                anchors.left: parent.left
                            }

                            Text {
                                text: qsTr('kW')
                                font.pixelSize: 14
                                color: Style.textColor

                                anchors.top: parent.bottom
                                anchors.right: parent.right
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            color: glassyBgColor
            radius: 16
            Layout.fillWidth: true
            Layout.preferredHeight: lightswitchescol.height + 28

            Item {
                anchors.fill: parent
                anchors.margins: 24
                height: lightswitchescol.height

                ColumnLayout {
                    id: lightswitchescol
                    width: parent.width
                    spacing: 16

                    RightPaneLightSwitchComponent {
                        label: qsTr('Windows')
                        checked: true
                    }

                    Item { Layout.fillHeight: true }

                    RightPaneLightSwitchComponent {
                        label: qsTr('Blinders')
                        checked: true
                    }

                    Item { Layout.fillHeight: true }

                    RightPaneLightSwitchComponent {
                        label: qsTr('Curtains')
                        checked: false
                    }
                }
            }
        }

        Rectangle {
            color: glassyBgColor
            radius: 16
            Layout.fillWidth: true
            Layout.preferredHeight: lightintensityitemcol.height + 48

            Item {
                anchors.fill: parent
                anchors.margins: 24
                height: lightintensityitemcol.height

                ColumnLayout {
                    id: lightintensityitemcol
                    width: parent.width
                    spacing: 16

                    RowLayout {
                        width: parent.width
                        height: 20

                        Text {
                            text: qsTr('Light Intensity')
                            font.pixelSize: 14
                            color: Style.textColor
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignVCenter
                        }

                        PrefsSwitch {
                            checked: true
                            Layout.alignment: Qt.AlignVCenter
                        }
                    }

                    Item { Layout.fillHeight: true }

                    PrefsProgressBar {
                        id: pb
                        width: parent.width
                        value: lightIntensity/100
                    }

                    Text {
                        text: Math.round(pb.value * 100)
                        font.pixelSize: 14
                        color: Style.textColor
                        width: parent.width
                        horizontalAlignment: Text.AlignRight
                    }
                }
            }
        }
    }
}
