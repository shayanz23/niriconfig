
import { createBinding, With } from "ags"
import { exec, execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Wp from "gi://AstalWp"

export default function Brightness() {
    let exists = true
    try {
        exec("bash -c 'brightnessctl -l | grep backlight'")
    } catch (error) {
        exists = false
    }
    const brightness = createPoll("", 1000, "brightnessctl g")

    return (
        <box>
            <With value={brightness}>
                {(value) =>
                    <box cssName={"brightness-box"} visible={exists}>
                        <button cssClasses={["brightness-button"]}>
                            <image iconName={"display-brightness-medium-symbolic"} />
                        </button>
                        <slider cssClasses={["menu-slider"]} widthRequest={295} value={Number(value)/255} onValueChanged={(self) => {
                            execAsync(`brightnessctl s ${self.value*255}`)
                            console.log(self.value*255)
                        }} />
                    </box>
                }
            </With>
        </box>
    )
}