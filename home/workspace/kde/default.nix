{
  pkgs,
  lib,
  config,
  ...
}:
let
  plasmaStyle = "Utterly-Round-Solid";
in
{
  imports = [
    ./shortcuts.nix
    # ./panels.nix
    ./workspace.nix
    ./startup.nix
    ./power.nix
    ./window-rules.nix
  ];

  home.packages = [
    pkgs.wayland
    pkgs.kdePackages.kwin
    pkgs.xwayland
    pkgs.kdePackages.kwayland
    pkgs.kdePackages.plasma-wayland-protocols
    pkgs.kdePackages.kirigami
    pkgs.darkly
    pkgs.kdePackages.plasma-browser-integration
    pkgs.utterly-round-plasma-style
    pkgs.volantes-cursors
  ];
  programs = {
    kate.enable = false;
    konsole.enable = false;
    plasma = {
      enable = true;
      immutableByDefault = true;
      # Some low-level settings:
      configFile = {
        "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
        "kwinrc"."Desktops"."Number" = {
          value = 2;
          immutable = true;
        };
        kdeglobals = {
          "General" = {
            "BrowserApplication" = config.browser;
          };
        };
        plasmarc.Theme.name = lib.mkForce plasmaStyle;
        klaunchrc = {
          BusyCursorSettings.Bouncing = false;
        };
        kxkbrc.Layout = with config.keyboard; {
          Layout = layout;
          Model = model;
          Options = options;
        };
      };

      kscreenlocker = {
        autoLock = false;
        appearance.wallpaper = config.stylix.image;
      };
    };
  };
  stylix.targets.kde = {
    enable = false;
    useWallpaper = false;
    decorations = "Utterly-Round-Dark-Solid";
  };
}
