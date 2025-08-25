import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { Accessor, createBinding, onCleanup, With } from "ags"
import Tray from "./Tray"
import GLib from "gi://GLib?version=2.0"
import QuickSettings from "./QuickSettings/QuickSettings"
import Power from "./Power"
import DateNotifications from "./DateNotifications/DateNotifications"
import AstalNetwork from "gi://AstalNetwork"

export default function Network() {
    const defaultNetwork = AstalNetwork.get_default();

    defaultNetwork.wifi.iconName

    const wifiIcon = createBinding(defaultNetwork.wifi, "iconName")

    const wiredIcon = createBinding(defaultNetwork.wired, "iconName")

    return(
        <box>
            <With value={createBinding(defaultNetwork, "primary")}>
                {(value) => value === AstalNetwork.Primary.WIFI ?
                    <image iconName={wifiIcon}></image> :
                    <image iconName={wiredIcon}></image>
                }
            </With>
        </box>
    )
}