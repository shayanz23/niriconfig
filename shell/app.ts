import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widgets/Windows/Bar/Bar"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"
import { Service } from "ags/dbus"
import main from "./main"
// const hyprland = await Service.import("hyprland")

// hyprland.connect("monitor-added", () => {
//   execAsync("/home/human/niriconfig/shell/start.sh")
// });

// hyprland.connect("monitor-removed", () => {
//   execAsync("/home/human/niriconfig/shell/start.sh")
// });




app.add_icons(`${GLib.get_user_data_dir()}/asta/icons`)
app.add_icons('/home/human/niriconfig/shell/icons')
app.start({
  css: style,
  
  main
})
