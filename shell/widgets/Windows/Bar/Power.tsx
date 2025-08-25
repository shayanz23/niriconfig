import { createBinding, With } from "ags"
import { Gtk } from "ags/gtk4"
import AstalBattery from "gi://AstalBattery"

export default function Power() {
    const Battery = AstalBattery.get_default()

    const charge = createBinding(Battery, "percentage")
    const icon = createBinding(Battery, "iconName")

    if (Battery.deviceType === 0) {
        return (
            <box cssName={"power"}>
                <image iconName={"turn-off-symbolic"} cssClasses={["symbolic-icon"]} />
            </box>
        )
    }

    return (
        <box cssName={"power"}>
            <image
                class="icon"
                iconName={icon}
            />
            <With value={charge}>
                {(value) => <label label={ " " + (value * 100) + "%"} />}
            </With>
        </box>
    )
}