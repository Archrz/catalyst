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

## Hosts

- `Silverbullet`

---

## Install

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

## Customize

Host overrides go in `hosts/<name>/variables.nix`

Monitors → `hosts/<name>/mango/extra.conf`

| Alias | Does                   |
| ----- | ---------------------- |
| `fr`  | rebuild + switch       |
| `fu`  | flake update + rebuild |
| `fb`  | build only             |
