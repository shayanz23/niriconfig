// common/TrayMenu.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

PopupWindow {
    id: popupWindow
    
    // The "Menu Handle" passed from the button
    required property var menuHandle

    // Positioning
    anchor.edges: Edges.Bottom | Edges.Right
    width: stackView.implicitWidth
    height: stackView.implicitHeight

    // Close on click-away
    visible: false
    onVisibleChanged: {
        if (visible) requestActivate();
        else {
            focus = false;
            stackView.pop(null); // Reset to main menu on close
        }
    }

    color: "transparent"

    // Background container
    Rectangle {
        anchors.fill: parent
        color: Theme.barBgColor
        border.color: Theme.darkGrey
        border.width: 1
        radius: 8
        clip: true

        StackView {
            id: stackView
            anchors.fill: parent
            
            // Set explicit size based on current menu
            implicitWidth: currentItem ? currentItem.implicitWidth : 200
            implicitHeight: currentItem ? currentItem.implicitHeight : 100

            // Initial view is the main menu
            initialItem: SubMenu {
                menuObject: popupWindow.menuHandle ? popupWindow.menuHandle.menu : null
            }

            // Simple transition animations
            pushEnter: Transition { NumberAnimation { property: "x"; from: stackView.width; to: 0; duration: 200; easing.type: Easing.OutCubic } }
            pushExit: Transition { NumberAnimation { property: "x"; from: 0; to: -stackView.width; duration: 200; easing.type: Easing.OutCubic } }
            popEnter: Transition { NumberAnimation { property: "x"; from: -stackView.width; to: 0; duration: 200; easing.type: Easing.OutCubic } }
            popExit: Transition { NumberAnimation { property: "x"; from: 0; to: stackView.width; duration: 200; easing.type: Easing.OutCubic } }
        }
    }

    // --- The Menu List Component ---
    component SubMenu: ColumnLayout {
        id: menuColumn
        property var menuObject: null // The QsMenu object
        spacing: 2
        
        implicitWidth: 220
        implicitHeight: childrenRect.height + 10

        // "Back" Button (Only shows if depth > 1)
        Button {
            visible: stackView.depth > 1
            Layout.fillWidth: true
            Layout.preferredHeight: 30
            background: Rectangle { color: "transparent" }
            contentItem: RowLayout {
                spacing: 5
                Text { text: "<"; color: Theme.barFgColor; font.bold: true }
                Text { text: "Back"; color: Theme.barFgColor; font.pixelSize: Theme.fontSize }
            }
            onClicked: stackView.pop()
        }

        // The Menu Items
        Repeater {
            // Access standard Quickshell .items list
            model: menuColumn.menuObject ? menuColumn.menuObject.items : []

            delegate: Rectangle {
                id: itemRect
                required property var modelData // The QsMenuEntry

                Layout.fillWidth: true
                Layout.preferredHeight: modelData.isSeparator ? 1 : 32
                
                // Visuals
                color: modelData.isSeparator ? Theme.darkGrey : (mouseArea.containsMouse ? Theme.blue : "transparent")
                radius: 4
                visible: modelData.visible

                // Mouse Handling
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    enabled: !parent.modelData.isSeparator && parent.modelData.enabled
                    
                    onClicked: {
                        if (itemRect.modelData.hasChildren) {
                            // Push submenu
                            stackView.push(subMenuComponent.createObject(stackView, {
                                menuObject: itemRect.modelData.menu
                            }))
                        } else {
                            // Trigger action and close
                            itemRect.modelData.triggered()
                            popupWindow.visible = false
                        }
                    }
                }

                // Content (Icon + Text + Arrow)
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8
                    visible: !parent.modelData.isSeparator
                    spacing: 8

                    // Check/Radio Indicator
                    Item {
                        width: 12; height: 12
                        visible: itemRect.modelData.buttonType !== 0
                        Rectangle {
                            anchors.centerIn: parent
                            width: 8; height: 8
                            radius: itemRect.modelData.buttonType === 2 ? 4 : 2
                            color: Theme.barFgColor
                            visible: itemRect.modelData.checked
                        }
                    }

                    // Icon


                    // Text Label
                    Text {
                        text: itemRect.modelData.text
                        color: parent.enabled ? Theme.barFgColor : Theme.darkGrey
                        font.pixelSize: Theme.fontSize
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }

                    // Arrow for submenus
                    Text {
                        text: ">"
                        color: Theme.barFgColor
                        visible: itemRect.modelData.hasChildren
                    }
                }
            }
        }
    }
    
    // Component factory for recursion
    Component { id: subMenuComponent; SubMenu {} }
}