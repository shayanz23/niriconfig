import { Gtk, Gdk } from "ags/gtk4"
import { For, createBinding, onCleanup } from "ags"
import AstalTray from "gi://AstalTray"

export default function Tray() {
    const tray = AstalTray.get_default();
    const items = createBinding(tray, "items");

    return (
        <box class="systray">
            <For each={items}>
                {item => {
                    const pop = Gtk.PopoverMenu.new_from_model(item.menuModel)
                    pop.insert_action_group('dbusmenu', item.actionGroup); pop.set_has_arrow(false)
                    item.connect('notify::menu-model', () => pop.set_menu_model(item.menuModel))
                    item.connect('notify::action-group', () => pop.insert_action_group('dbusmenu', item.actionGroup))
                    const conns = [
                        item.connect("notify::menu-model", () =>
                            pop.set_menu_model(item.menuModel),
                        ),
                        item.connect("notify::action-group", () =>
                            pop.insert_action_group("dbusmenu", item.actionGroup),
                        ),
                    ];

                    onCleanup(() => {
                        pop.unparent();
                        conns.map((id) => item.disconnect(id));
                    });
                    return (
                        <button
                            valign={Gtk.Align.CENTER}
                            tooltip_markup={createBinding(item, 'tooltipMarkup')}
                            $={btn => pop.set_parent(btn)} onClicked={() => pop.popup()}>
                            <image gicon={createBinding(item, 'gicon')} />
                        </button>
                    )
                }}
            </For>
        </box>
    );
}