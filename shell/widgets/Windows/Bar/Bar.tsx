import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import { Accessor, createBinding, onCleanup } from "ags"
import Tray from "./Tray"
import GLib from "gi://GLib?version=2.0"
import QuickSettings from "./QuickSettings/QuickSettings"
import Power from "./Power"
import DateNotifications from "./DateNotifications/DateNotifications"
import Wp from "gi://AstalWp"
import Network from "./Network"

export default function Bar({
    gdkmonitor,
    $,
}: JSX.IntrinsicElements["window"] & { gdkmonitor: Gdk.Monitor }) {
    const time = createPoll("", 1000, () => GLib.DateTime.new_now_local().format("%b %e  %R")!)
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    const wp = Wp.get_default()
    const default_speaker = createBinding(wp.audio, "default_speaker")
    const volumeIcon = createBinding(default_speaker.get(), "volumeIcon")

    return (
        <window
            visible
            name="bar"
            class="Bar"
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
            anchor={TOP | LEFT | RIGHT}
            $={(self) => onCleanup(() => self.destroy())}
        >
            <centerbox cssName="centerbox">
                <button
                    $type="start"
                    onClicked={() => execAsync("echo hello").then(console.log)}
                    cssClasses={["root-gobject"]}
                >
                    <label label="Welcome to AGS!" />
                </button>
                <menubutton $type="center" cssClasses={["root-gobject"]} hexpand halign={Gtk.Align.CENTER}>
                    <box cssName={"middle-Gtk.Box"}>
                        <box></box>
                        <label cssName={"time"} label={time} />
                    </box>
                    <popover>
                        <DateNotifications />
                    </popover>
                </menubutton>
                <box $type="end" cssClasses={["root-gobject"]}>
                    <box>
                        <Tray></Tray>
                    </box>
                    <menubutton cssName={"right-menu-button"}>
                        <box cssName={"right-menu-box"}>
                            <Network></Network>
                            <image iconName={volumeIcon} cssClasses={["symbolic-icon"]} />
                            <Power></Power>
                        </box>
                        <popover>
                            <QuickSettings />
                        </popover>
                    </menubutton>
                </box>
            </centerbox>
        </window>
    )
}
