import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.SystemTray
import "../common"

Rectangle {
    width: qs.implicitWidth + 10
    height: qs.implicitHeight + 5
    color: hoverHandler.hovered ? Theme.darkGrey : "transparent"
    radius: 10
    RowLayout {
        id: qs
        anchors.centerIn: parent
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: Theme.rowLayoutMarginSize
        }
        spacing: Theme.rowLayoutMarginSize
        Loader { active: true; sourceComponent: Volume {} }
    }
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        cursorShape: Qt.PointingHandCursor
        onClicked: (mouse) => {

        }
    }
    HoverHandler {
        id: hoverHandler
    }
}