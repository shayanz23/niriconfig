
import { createBinding, With } from "ags"
import { execAsync } from "ags/process"
import Wp from "gi://AstalWp"

export default function Volume() {
    const wp = Wp.get_default()
    const default_speaker = createBinding(wp.audio, "default_speaker")
    const volume = createBinding(default_speaker.get(), "volume")
    const volumeIcon = createBinding(default_speaker.get(), "volumeIcon")

    return (
        <box cssName={"volume-box"}>
            <button cssClasses={["volume-button"]} onClicked={() => execAsync("pavucontrol")}>
                <image iconName={volumeIcon} />
                </button>
            <slider cssClasses={["volume-slider"]} widthRequest={295} value={volume} onValueChanged={(self) => {
                default_speaker.get().set_volume(self.value);
            }} />
        </box>
    )
}