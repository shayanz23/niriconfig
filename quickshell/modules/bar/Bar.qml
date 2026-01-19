//@ pragma UseQApplication

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.SystemTray
import "../common"


PanelWindow {
    id: barWindow
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: Theme.barHeight
    color: "transparent"

    
    Rectangle {
        anchors.fill: parent
        color: Theme.barBgColor

        // left
        RowLayout {
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: Theme.rowLayoutMarginSize
            }
            Loader { 
                active: true; 
                sourceComponent: Workspaces {} 
                
                }
            Text {
                text: (niri.focusedWindow?.title.length > 70 ? niri.focusedWindow?.title.substring(0, 71) + "..." : niri.focusedWindow?.title) ?? ""
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSize
                color: Theme.barFgColor
            }
        }
        // center
        RowLayout {
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Loader { active: true; sourceComponent: Time {} }
        }
        // right
        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: Theme.rowLayoutMarginSize
            }
            spacing: Theme.rowLayoutMarginSize

            
            Loader { active: true; sourceComponent: Tray {} }
            Loader { active: true; sourceComponent: QuickSettings {} }
        }
    }



}