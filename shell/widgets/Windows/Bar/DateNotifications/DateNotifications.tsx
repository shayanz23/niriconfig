import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";
import GLib from "gi://GLib";
import MediaControls from "./MediaControls";
import Notifications from "./Notifications";


export default function DateNotifications() {
    const day = createPoll("", 1800000, () => GLib.DateTime.new_now_local().format("%A")!)
    const date = createPoll("", 1800000, () => GLib.DateTime.new_now_local().format("%B %e %Y")!)
    return (
        <box cssName={"date-notifications"}>
            <box cssName={"mpris-notifs-box"} orientation={Gtk.Orientation.VERTICAL}>
                <MediaControls/>
                <Notifications/>
            </box>
            <box cssName={"date-weather"} orientation={Gtk.Orientation.VERTICAL}>
                <box>
                    <label cssName={"fancy-day"} label={day} />
                </box>
                <box>
                    <label cssName={"fancy-date"} label={date} />
                </box>
                <Gtk.Calendar cssName={"calendar"} />
            </box>
        </box>
    )
}