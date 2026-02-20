# Waybar on Arch Linux + niri

This directory contains four Waybar configs:

- `top.jsonc` + `top.css`
- `bottom.jsonc` + `bottom.css`
- `left.jsonc` + `left.css`
- `right.jsonc` + `right.css`

## 1) Install dependencies (Arch)

```bash
sudo pacman -S waybar playerctl networkmanager
```

Optional apps used by custom buttons/modules in these configs:

- `ghostty`, `firefox`, `discord`, `steam`, `code`, `wlogout`, `protonvpn-app`, `VacuumTube`, `qmmp`

If one of these is missing, that specific click action just won't work.

## 2) Launch all bars

From this repo:

```bash
./waybar/launch-niri-waybar.sh
```

This script restarts waybar cleanly and launches all four bars.

## 3) Start automatically with niri

Add a startup command in your niri config to run:

```bash
/path/to/your/repo/waybar/launch-niri-waybar.sh
```

(use your absolute path)

## Do I need keybindings for each Waybar?

No — not for normal use.

- Waybar runs as background panel processes.
- You typically autostart them once when niri starts.
- Keybindings are only optional if you want **extra controls** (e.g., toggle/reload/restart bars on demand).

### Optional keybinding idea

If you want a manual reload keybind in niri, bind a key to:

```bash
pkill -x waybar; /path/to/your/repo/waybar/launch-niri-waybar.sh
```

That is enough; no separate keybind per bar is required.
