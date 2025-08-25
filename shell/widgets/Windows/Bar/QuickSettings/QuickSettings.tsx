import { Gtk } from "ags/gtk4";
import Battery from "./BatteryButton";
import Volume from "../QuickSettings/Volume";
import { execAsync } from "ags/process";




export default function QuickSettings() {


    return (
        <box cssName={"quick-settings-box"} orientation={Gtk.Orientation.VERTICAL}>
            <box cssName={"quick-actions--battery-box"} hexpand>
                <Battery></Battery>
                <box cssName={"quick-actions-box"} halign={Gtk.Align.END} hexpand>
                    <button iconName={"screenshooter-symbolic"} onClicked={() => execAsync("niri msg action screenshot")}></button>
                    <button iconName={"settings-symbolic"}></button>
                    <button iconName={"padlock2-symbolic"} onClicked={() => execAsync("hyprlock")}></button>
                    <button iconName={"turn-off-symbolic"} onClicked={() => execAsync("bash /home/human/niriconfig/rofi/powermenu/run-power-menu.sh")}></button>
                </box>
            </box>
            <Volume></Volume>
        </box>
    )
}