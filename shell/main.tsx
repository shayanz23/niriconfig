import { createBinding, For, onCleanup, This } from "ags"
import app from "ags/gtk4/app"
import Bar from "./widgets/Windows/Bar/Bar"
import { Gdk } from "ags/gtk4"


export default function main() {
    const monitors = createBinding(app, "monitors")

    return (
        <For each={monitors}>
            {(monitor: Gdk.Monitor) => (
                <This this={app}>
                    <Bar gdkmonitor={monitor}/>
                </This>
            )}
        </For>
    )
}