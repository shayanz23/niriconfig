import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import "../common"

Rectangle {
    height: timeBlock.implicitHeight
    color: hoverHandler.hovered ? Theme.darkGrey : "transparent"    
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
    

    radius: 10
    HoverHandler {
        id: hoverHandler
    }
    Text {
        id: timeBlock
        anchors {
            verticalCenter: parent.verticalCenter
        }
        text: Qt.formatDateTime(clock.date, "MMM dd, yyyy hh:mm")
        color: Theme.barFgColor
        font.family: "Barlow Medium"
        font.pixelSize: Theme.fontSize
        Component.onCompleted: {
            parent.width = timeBlock.contentWidth + 15
        }
        anchors.horizontalCenter: parent.horizontalCenter 
    }
}