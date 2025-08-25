import { Accessor, createBinding, createComputed, createState, For, With } from "ags";
import { Gtk } from "ags/gtk4";
import Adw from "gi://Adw";
import Mpris from "gi://AstalMpris"

export default function MediaControls() {


    const players = createBinding(Mpris.get_default(), "players")



    return (
        <box orientation={Gtk.Orientation.VERTICAL}>
            <For each={players}>
                {player => {
                    const title = createBinding(player, "title")
                    const artist = createBinding(player, "artist")
                    const artPath = createBinding(player, "coverArt")
                    const status = createBinding(player, "playbackStatus")
                    return (
                        <box cssName={"media-player-box"} orientation={Gtk.Orientation.VERTICAL} >
                            <box>
                                <label cssName={"media-player-identity"} label={player.identity} />
                            </box>
                            <box cssName={"media-player-box-box"}>
                                <box>
                                    <With value={artPath}>
                                        {(value) => value ?
                                            <image cssName={"media-cover-art"} file={value} pixelSize={60} /> :
                                            <image cssName={"media-cover-art"} iconName="applications-multimedia-symbolic" pixelSize={60} />
                                        }
                                    </With>
                                </box>
                                <box cssName={"media-title-artist-box"} orientation={Gtk.Orientation.VERTICAL}>
                                    <box>
                                        <With value={title}>
                                            {(value) => value !== null && value ?
                                                <label cssName={"media-title"} label={value} maxWidthChars={1} /> : <box />
                                            }
                                        </With>
                                    </box>
                                    <box>
                                        <box>
                                            <With value={artist}>
                                                {(value) => value !== null && value ?
                                                    <label cssName={"media-artist"} label={value} maxWidthChars={1} /> : <box />
                                                }
                                            </With>
                                        </box>
                                        <box cssName={"media-control-box"} halign={Gtk.Align.END} hexpand valign={Gtk.Align.END}>
                                            <button onClicked={() => player.previous()}>
                                                <image iconName={"skip-backward-large-symbolic"} />
                                            </button>
                                            <box>
                                                <With value={status}>
                                                    {(value) => value === Mpris.PlaybackStatus.PLAYING ?
                                                        <Adw.Clamp maximumSize={10}>
                                                            <button onClicked={() => player.play_pause()}>
                                                                <image iconName={"pause-large-symbolic"} />
                                                            </button>
                                                        </Adw.Clamp> :
                                                        <Adw.Clamp maximumSize={10}>
                                                            <button onClicked={() => player.play_pause()}>
                                                                <image iconName={"play-large-symbolic"} />
                                                            </button>
                                                        </Adw.Clamp>
                                                    }
                                                </With>
                                            </box>
                                            <button onClicked={() => player.next()}>
                                                <image iconName={"skip-forward-large-symbolic"} />
                                            </button>
                                        </box>
                                    </box>
                                </box>

                            </box>
                        </box>
                    )
                }}
            </For>
        </box>
    )

}