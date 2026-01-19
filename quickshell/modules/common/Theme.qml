pragma Singleton
import QtQuick

QtObject {

    property bool dark: true

    property int fontSize: 16
    property int headerSize: fontSize + 4
    property string fontFamily: "Adwaita Sans"

    property string accentColour: "#F9BD30"

    property string barBgColor: dark ? "#000000" : "#ffffff"
    property string barFgColor: dark ? "#ffffff" : "#000000"
    property string darkGrey: dark ? "#3c3c3c" : "#e1e1e1"
    property string lightGrey: dark ? "#e1e1e1" : "#3c3c3c"


    property int barHeight: 30
    property int barIconSize: 19
    property int rowLayoutMarginSize: 7

    property int workspacesSize: 17
    
}