
import { createBinding, With } from "ags"
import { exec, execAsync } from "ags/process"
import { createPoll } from "ags/time"

export default function Brightness() {
    let MAX = 0
    let exists = true
    try {
        MAX = Number(exec("brightnessctl m"))
        exec("bash -c 'brightnessctl -l | grep backlight'")
    } catch (error) {
        console.log(error)
        exists = false
    }



    if (!exists) {
        return [
            <box/>
        ]
    }    

    const brightness = createPoll("", 5000, "brightnessctl g")

    return (
        <box>
            <With value={brightness}>
                {(value) =>
                    <box cssName={"brightness-box"}>
                        <button cssClasses={["brightness-button"]}>
                            <image iconName={"display-brightness-medium-symbolic"} />
                        </button>
                        <slider cssClasses={["menu-slider"]} widthRequest={295} value={Number(value)/MAX} onValueChanged={(self) => {
                            execAsync(`brightnessctl s ${self.value*MAX}`)
                        }} />
                    </box>
                }
            </With>
        </box>
    )
}