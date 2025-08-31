import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";
import GLib from "gi://GLib";
import MediaControls from "./MediaControls";
import Notifications from "./Notifications";
import { With } from "ags";


export default function DateNotifications() {
    const dayFormatted = createPoll("", 600000, () => GLib.DateTime.new_now_local().format("%A")!)
    const dayofMonth = createPoll(1, 600000, () => GLib.DateTime.new_now_local().get_day_of_month()!)
    const month = createPoll(1, 600000, () => GLib.DateTime.new_now_local().get_month()!)
    const year = createPoll(1, 600000, () => GLib.DateTime.new_now_local().get_year()!)
    const dateFormatted = createPoll("", 600000, () => GLib.DateTime.new_now_local().format("%B %e %Y")!)
    return (
        <box cssName={"date-notifications"}>
            <box cssName={"mpris-notifs-box"} orientation={Gtk.Orientation.VERTICAL}>
                <MediaControls/>
                <Notifications/>
            </box>
            <box cssName={"date-weather"} orientation={Gtk.Orientation.VERTICAL}>
                <box>
                    <label cssName={"fancy-day"} label={dayFormatted} />
                </box>
                <box>
                    <label cssName={"fancy-date"} label={dateFormatted} />
                </box>
                <Gtk.Calendar cssName={"calendar"} onDaySelected={cal => {
                    const today = GLib.DateTime.new_now_local()
                    cal.day = today.get_day_of_month()
                }} onNextMonth={cal => {
                    const today = GLib.DateTime.new_now_local()
                    cal.month = today.get_month() - 1
                    cal.day = today.get_day_of_month()
                }} onPrevMonth={cal => {
                    const today = GLib.DateTime.new_now_local()
                    cal.month = today.get_month() - 1
                }} onNextYear={cal => {
                    const today = GLib.DateTime.new_now_local()
                    cal.year = today.get_year()
                }} onPrevYear={cal => {
                    const today = GLib.DateTime.new_now_local()
                    cal.year = today.get_year()
                }}/>
            </box>
        </box>
    )
}