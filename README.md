# nixconfig — personal Nix flake (annotated & usage guide)

A flake-based NixOS / Home Manager configuration for the user `andrec` on the host `seadragon`. This repository wires several community flakes (stylix, vicinae, plasma-manager, niri, nixvim, Da...).

View the full tree on GitHub for additional files and context:
https://github.com/AndreBClark/nixconfig/tree/main

Important note: this repository does not use nixpkgs overlays for custom packages. Any local package expressions under `pkgs/` are simple package expressions (not applied to nixpkgs via overlays).

Quick summary
- Flake: top-level `flake.nix` (pins inputs in `flake.lock`).
- System host: `hosts/seadragon` — system config, hardware, and host home glue.
- User / home-manager: `home/seadragon.nix` and the `home/` tree (theme, programs, terminal, cli, workspace).
- Neovim is configured via nixvim under `home/cli/nvim`.
- Window / desktop setups:
  - KDE / Plasma: files under `home/workspace/kde/`.
  - Niri / Wayland integration: `display/niri.nix` (with home-level niri integrations).
- Theme & styling: `home/theme/stylix` and `home/theme/fonts.nix` (wallpaper: `fallingfrontier.jpg`).
- Note: rofi and dunst fragments exist but may not be used; they can be removed if you want a cleaner tree.

Repository layout (most relevant)
- flake.nix — inputs/outputs and `nixosConfigurations.seadragon`.
- flake.lock — pinned inputs.
- hosts/seadragon/
  - configuration.nix — imports `nixos/` plus display modules (`display/dms.nix`, `display/niri.nix`, `display/plasma.nix`).
  - hardware.nix, hardware-configuration.nix — hardware options for the host.
  - home.nix — wires home-manager and stylix for the host.
- home/
  - seadragon.nix — user's home-manager entry; imports:
    - `home/default.nix`, `home/theme`, `home/programs`, `home/terminal`, `home/workspace`, `home/cli`, `home/services`.
  - theme/ — stylix theme, fonts, and theme targets.
  - cli/nvim/ — nixvim configuration (options, keymaps, lsp, plugins).
  - terminal/ — alacritty, kitty, fish, starship fragments.
  - workspace/kde/ — Plasma settings and panels.
- display/ — display greeter / compositor integration (dms, niri, plasma).
- pkgs/ — local package expressions (not overlays).

Getting started (minimal)
1. Clone:
   - git clone https://github.com/AndreBClark/nixconfig.git
   - cd nixconfig
2. Optional but convenient:
   - export NH_FLAKE="$(pwd)"
3. Install/run nh:
   - nix shell nixpkgs#nh
   - or: nix shell github:nix-community/nh
4. System (run on target machine or via SSH):
   - nh os switch . -H seadragon
   - with NH_FLAKE set: nh os switch -H seadragon
5. Home manager (user `andrec`):
   - nh home switch . -c andrec
   - with NH_HOME_FLAKE / NH_FLAKE: nh home switch -c andrec

Neovim (nixvim) — where and what
Location: home/cli/nvim/

Files:
- default.nix — imports nixvim module and local fragments.
- options.nix — editor options (numbers, tab/shiftwidth, termguicolors, clipboard, folds, sessionoptions, etc.).
- keymaps.nix — leader key mappings, buffer/window mappings, Telescope/LSP bindings, ToggleTerm integration, Ufo folds, etc.
- lsp.nix — language server settings and LSP-related configuration.
- plugins/ — place for plugin overrides or additions.

Behavior and where to change:
- nixvim is enabled via `programs.nixvim.enable = true` in `default.nix`.
- To change editor options: edit `home/cli/nvim/options.nix`.
- To change keybindings: edit `home/cli/nvim/keymaps.nix`.
- To add or customize plugins: place overrides or additional plugin expressions in `home/cli/nvim/plugins/`.
- LSP servers and per-language overrides live in `home/cli/nvim/lsp.nix`.

Window managers & desktop environments
Multiple desktop paths are available; enable the appropriate modules to pick which to activate.

KDE / Plasma
- Files: `home/workspace/kde/` (default.nix, workspace.nix, panels.nix).
- Highlights:
  - `programs.plasma.enable = true` and a set of Plasma customizations (theme, icon theme, cursor, kwin rules).
  - Bottom panel configured in `panels.nix` with quicklaunch, pager, task manager, system tray, and clock.
  - Packages for Plasma (kwin, kwayland, plasma-wayland-protocols, plasma-browser-integration, styles, cursors) are included in the home-level package list in `home/workspace/kde/default.nix`.
- Where to change:
  - Panels & widgets: edit `home/workspace/kde/panels.nix`.
  - Global plasma settings: edit `home/workspace/kde/workspace.nix`.

Niri (Wayland compositor) integration
- File: `display/niri.nix` (imported by host configuration).
- What it does:
  - Imports `inputs.niri.nixosModules.niri` and enables `programs.niri` (package `pkgs.niri-unstable`).
  - Adds Wayland-related packages to `environment.systemPackages` (wl-clipboard, wayland-utils, cage, gamescope, xdg-desktop-portal-gnome, etc).
  - Sets `environment.variables.NIXOS_OZONE_WL = "1"`.
- Where to change:
  - Edit `display/niri.nix` to change package choices or environment variables.
  - See any home-level integrations (e.g., `home/workspace/niri`) or modules referencing `dms.niri` or `vicinae` for greeter/compositor integration.

Theme & visuals
- Stylix is used via `home/theme/stylix/`:
  - Colorscheme: tokyo-night (variant: storm).
  - Wallpaper: `fallingfrontier.jpg` (referenced in `theme.nix`).
  - Fonts in `home/theme/fonts.nix`: JetBrainsMono Nerd Font, Fira Code Nerd Font, Noto Color Emoji.
- If you change the wallpaper file, update the SHA in `home/theme/stylix/theme.nix` or use a local path instead of fetchurl.

Packages & local package expressions
- Local package expressions in `pkgs/` exist (for example, a rofi-launchers expression), but this repository does not use overlays to inject packages into nixpkgs.
- To add system packages: edit the appropriate `nixos/` module or `hosts/seadragon/*` (add to `environment.systemPackages`).
- To add user packages: add to `home.packages` in `home/seadragon.nix` or the module that makes sense (e.g., `home/programs`, `home/cli`, `home/terminal`).

Commands & cheatsheet
- Dev / nh:
  - nix shell nixpkgs#nh
  - export NH_FLAKE="$(pwd)" (optional)
- System:
  - nh os build . -H seadragon
  - nh os switch . -H seadragon
  - NH_SHOW_ACTIVATION_LOGS=1 nh os switch . -H seadragon
- Home:
  - nh home build . -c andrec
  - nh home switch . -c andrec
- Clean:
  - nh clean --keep 3 --keep-since 7d
- Update flake inputs:
  - nix flake update

Notes & troubleshooting
- Activation issues: use `NH_SHOW_ACTIVATION_LOGS=1` to view activation logs.
- Neovim issues: rebuild home or inspect plugin logs; `nh home build` helps to validate derivations.
- If you remove unused fragments (rofi, dunst), make sure nothing imports them.

Contributing
- If you make changes to files referenced elsewhere (for example, wallpapers or package expressions), update any dependent SHAs or references.
- Prefer adding local package expressions to `pkgs/` and referencing them explicitly rather than using overlays.

License and attribution
- See repository files for licensing and attribution where applicable.
