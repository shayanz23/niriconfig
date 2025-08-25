import { createBinding, With } from "ags"
import { Gtk } from "ags/gtk4"
import AstalBattery from "gi://AstalBattery"

export default function Battery() {
    const Battery = AstalBattery.get_default()

    const charge = createBinding(Battery, "percentage")
    const icon = createBinding(Battery, "iconName")

    if (Battery.deviceType === 0) {
        return(<box></box>)
    }

    return (
        <button
            class="battery"
            hexpand={false}
        >
            <box>
                <image
                    class="icon"
                    iconName={icon}
                />
                <With value={charge}>
                    {(value) => <label label={" " + Math.round((value * 100)) + "%"} />}
                </With>
            </box>
        </button>
    )
}