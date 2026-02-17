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

  home.packages = builtins.attrValues {
    inherit (pkgs)
      wayland
      xwayland
      utterly-round-plasma-style
      volantes-cursors
      darkly
      ;
    inherit (pkgs.kdePackages)
      kwin
      kwayland
      plasma-wayland-protocols
      kirigami
      plasma-browser-integration
      ;
  };
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
        kxkbrc.Layout =
          let
            xkb = config.keyboard;
          in
          {
            Layout = xkb.layout;
            Model = xkb.model;
            Options = xkb.options;
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
