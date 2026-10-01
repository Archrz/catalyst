<div align="center">
  <img src="home/arch/wall/img/catalyst-logo.png" alt="Catalyst" width="640">
</div>

---

Catalyst is the project name for my personal nixos config.

| Component    | Using          |
| ------------ | -------------- |
| **os**       | NixOS          |
| **wm**       | Mango          |
| **launcher** | catalyst-shell |
| **login**    | catalyst-sddm  |
| **terminal** | Ghostty        |
| **shell**    | fish           |
| **editor**   | Neovim         |
| **editor**   | Zed            |

---

## features

**catalyst-shell** — bar, custom launcher, dashboard, notifications, lock screen, idle overlay, screenshot UI with markup, popups for audio, brightness, bluetooth, wifi, calendar, color picker, and power profile.

**modular hosts** — each machine lives in `hosts/<name>/` with its own hardware, GPU, packages, and Mango overrides.

---

## hosts

- `Silverbullet`

---

## install

```bash
nixos-install --flake github:Archrz/catalyst#Silverbullet
```

New machine — edit `hosts/<name>/disko.nix`, then:

```bash
nix run github:nix-community/disko -- --mode destroy,format,mount --flake .#HOST
nixos-install --no-root-passwd --root /mnt --flake .#HOST
```

```bash
fr
```

---

## customize

Host overrides go in `hosts/<name>/variables.nix` — terminal, timezone, steam, virtualbox, etc.

Monitors → `hosts/<name>/mango/extra.conf`

| Alias | Does                   |
| ----- | ---------------------- |
| `fr`  | rebuild + switch       |
| `fu`  | flake update + rebuild |
| `fb`  | build only             |
