import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "../common"

Rectangle {
    id: root
    width: layout.implicitWidth
    height: layout.implicitHeight
    color: "transparent"

    property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [ sink ]
    }

    RowLayout {
        id: layout
        anchors.centerIn: parent

        IconImage {
            id: volumeIcon
            implicitSize: Theme.barIconSize

            source: Quickshell.iconPath(getIcon())

            // source: Quickshell.iconPath("audio-volume-muted")

            function getIcon() {
                // Check if sink or audio object exists to prevent errors
                if (!sink || !sink.audio || sink.audio.muted || sink.audio.volume === 0) return "audio-volume-muted-symbolic";
                
                
                if (sink.audio.volume > 0.66) return "audio-volume-high-symbolic";
                if (sink.audio.volume > 0.33) return "audio-volume-medium-symbolic";
                
                return "audio-volume-low-symbolic";
            }
        }
    }
    
    MouseArea {
        anchors.fill: parent
        // 4. Mute via sink.audio.muted
        onClicked: {
            if (sink && sink.audio) {
                sink.audio.muted = !sink.audio.muted
            }
        }
    }
}