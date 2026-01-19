import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick.Effects
import "../common"

RowLayout {
    anchors.verticalCenter: parent.verticalCenter        

    

    Repeater {
        model: SystemTray.items

        delegate: Item {
            required property SystemTrayItem modelData
            width: Theme.barIconSize
            height: Theme.barIconSize

            QsMenuAnchor {
                id: menuAnchor
                menu: modelData.menu
                anchor.window: barWindow
                anchor.edges: Edges.Bottom | Edges.Right
            }

            Button {
                id: trayButton
                width: Theme.barIconSize + 5
                height: Theme.barIconSize + 5
                anchors.centerIn: parent

                background: Rectangle {
                    color: hoverHandler.hovered ? Theme.darkGrey : "transparent"
                    radius: 10
                    HoverHandler {
                        id: hoverHandler
                    }
                }
                IconImage {
                    id: trayIcon
                    anchors.centerIn: parent
                    source: modelData.icon
                    implicitSize: Theme.barIconSize
                
                }
                // Use MouseArea for Right Click detection
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    cursorShape: Qt.PointingHandCursor
                    
                    onClicked: (mouse) => {
                        if (mouse.button === Qt.LeftButton) {
                            modelData.activate()
                        } else if (mouse.button === Qt.RightButton) {
                            // 1. Calculate the global position of this specific button
                            //    relative to the main bar window's content
                            const pos = trayButton.mapToItem(barWindow.contentItem, 0, 0);

                            // 2. Set the anchor rectangle to match the button exactly
                            menuAnchor.anchor.rect.x = pos.x;
                            menuAnchor.anchor.rect.y = pos.y;
                            menuAnchor.anchor.rect.width = trayButton.width;
                            menuAnchor.anchor.rect.height = trayButton.height;

                            // 3. Open the menu
                            menuAnchor.open();
                        }
                    }
                }
            }
        }
    }
}