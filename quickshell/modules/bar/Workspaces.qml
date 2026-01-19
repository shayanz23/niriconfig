import QtQuick
import QtQuick.Layouts
import Quickshell
import "../common"

Rectangle {
    anchors.left: parent.left
    color: "transparent"

    width: workspaceLayout.implicitWidth
    height: workspaceLayout.implicitHeight

    RowLayout {
        id: workspaceLayout
        anchors {
            verticalCenter: parent.verticalCenter
        }
        spacing: 5

        Repeater {
            model: niri.workspaces

            Rectangle {
                visible: index < 11
                width: Theme.workspacesSize
                height: Theme.workspacesSize
                radius: 10
                color: model.isActive ? Theme.lightGrey : Theme.darkGrey
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: niri.focusWorkspaceById(model.id)
                }

                Rectangle {
                    anchors {
                        centerIn: parent
                    }
                    visible: (index < 11 && model.isActive)
                    width: 9
                    height: 9
                    radius: 10
                    color: Theme.darkGrey

                }
            }
        }
    }
}