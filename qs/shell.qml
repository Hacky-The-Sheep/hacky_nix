import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root
    
    // Theme
    property color colBg: "#1e1e2e"
    property color colFg: "#a9b1d6"
    property color colMuted: "#bac2de"
    property color colCyan: "#89dceb"
    property color colBlue: "#89b4fa"
    property color colYellow: "#f9e2af"
    property string fontFamily: "Iosevka"
    property int fontSize: 16

    // Anchors
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "#1e1e2e"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        Repeater {
            model: 9

            Text {
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                text: index + 1
                color: isActive ? root.colCyan : (ws ? root.colCyan : root.colMuted )
                font { pixelSize: root.fontSize; bold: true }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
        Rectangle { width: 3; height: 16; color: root.colMuted }

        Item { Layout.fillWidth: true }

        Item {
            Layout.fillWidth: true
            
            Text {
                id: clock
                anchors.centerIn: parent
                color: root.colYellow
                font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
                text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                }
            }
        }
        Item { Layout.fillWidth: true }
        Text {
            text: "Goodnight Sir"
            color: root.colYellow
            font {
                family: root.fontFamily
                pixelSize: root.fontSize
            }
        }
    }
}
