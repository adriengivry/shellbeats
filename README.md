# ShellTunes

A terminal music player for Linux. Search YouTube, stream audio, and download tracks, all from your command line.

> Fork of [shellbeats](https://github.com/lalodev/shellbeats).

![Demo](assets/shellbeats.gif)

## Dependencies

- `mpv` — audio playback
- `yt-dlp` — YouTube search, streaming, downloading (auto-managed)
- `ncurses` — terminal UI
- `curl` or `wget` — needed for yt-dlp auto-update

## Install

```bash
# Debian/Ubuntu
sudo apt install mpv libncurses-dev yt-dlp

# Arch
sudo pacman -S mpv ncurses yt-dlp

# macOS
brew install mpv yt-dlp
```

```bash
make
make install   # copies binary to /usr/local/bin/shelltunes
```

## Run

```bash
shelltunes
shelltunes -log   # enable debug logging to ~/.shelltunes/shelltunes.log
```

## Controls

### Playback

| Key | Action |
|-----|--------|
| `/` or `s` | Search YouTube |
| `Enter` | Play selected |
| `Space` | Pause/Resume |
| `n` / `p` | Next / Previous track |
| `x` | Stop playback |
| `R` | Toggle shuffle |
| `←` / `→` | Seek backward/forward |
| `t` | Jump to time (mm:ss) |
| `q` | Quit |

### Navigation

| Key | Action |
|-----|--------|
| `↑/↓` or `j/k` | Move selection |
| `PgUp/PgDn` | Page up/down |
| `g` / `G` | Jump to start/end |
| `Esc` | Go back |

### Playlists

| Key | Action |
|-----|--------|
| `f` | Open playlists |
| `a` | Add song to playlist |
| `c` | Create playlist |
| `e` | Rename playlist |
| `p` | Import YouTube playlist |
| `r` | Remove song |
| `d` / `D` | Download song / Download all |
| `x` | Delete playlist |

### Other

| Key | Action |
|-----|--------|
| `S` | Settings |
| `i` | About |
| `h` or `?` | Help |

## How it works

- **Search** — yt-dlp fetches results from YouTube
- **Stream** — mpv plays audio; shelltunes talks to it via a Unix socket
- **Download** — runs in a background thread; queue persists across restarts
- **Smart playback** — plays from local disk when available, streams otherwise
- **yt-dlp auto-update** — keeps a local binary in `~/.shelltunes/bin/` up to date automatically

## Storage

```
~/.shelltunes/
├── config.json
├── playlists.json
├── download_queue.json
├── shelltunes.log       # with -log flag
├── yt-dlp.version
├── bin/yt-dlp
└── playlists/
    └── *.json

~/Music/shelltunes/
└── PlaylistName/
    └── Song_Title_[videoid].mp3
```

## License

GPL-3.0
