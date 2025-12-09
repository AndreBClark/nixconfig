{
  pkgs,
  lib,
  config,
  ...
}:
let
  plasmaStyle = "Utterly-Round-Solid";
  qtPlatform = "kde";
  defaultBrowser = "vivaldi";
in
{
  programs.plasma.enable = true;
  imports = [
    ./shortcuts.nix
    ./panels.nix
    ./workspace.nix
  ];
  programs.kate.enable = false;
  programs.plasma = {
    immutableByDefault = true;
    # overrideConfig = true;
    # resetFilesExclude = [
    # "plasma-org.kde.plasma.desktop-appletsrc"
    # ];
    # Some low-level settings:
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."Desktops"."Number" = {
        value = 2;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      kdeglobals = {
        "General" = {
          "BrowserApplication" = "vivaldi";
        };
      };
      plasmarc.Theme.name = lib.mkForce plasmaStyle;
      klaunchrc = {
        # No bouncy cursor
        BusyCursorSettings.Bouncing = false;
      };
      kxkbrc.Layout = {
        Model = "pc86";
        Options = "caps:escape";
      };
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    startup.startupScript = {
      steam.text = "steam -silent";
    };

    kscreenlocker = {
      autoLock = false;
      appearance.wallpaper = config.stylix.image;
    };
    powerdevil = {
      AC = {
        powerButtonAction = lib.mkForce "nothing";
        autoSuspend = {
          action = "sleep";
          idleTimeout = 60 * 60;
        };
        whenSleepingEnter = "standbyThenHibernate";
      };
    };
    window-rules = [
      {
        apply.noborder = {
          value = true;
          apply = "force";
        };
        description = "Hide titlebar by default";
        match = {
          window-class = {
            value = ".*";
            type = "regex";
          };
          window-types = [ "normal" ];
        };
      }
      {
        apply.above = "force";
        description = "Show Picture in Picture above all";
        match.title = {
          value = "Picture in picture";
          type = "exact";
        };
      }
    ];
  };

  home.packages = [
    pkgs.wayland
    #       wayqt
    pkgs.kdePackages.kwin
    pkgs.xwayland
    pkgs.kdePackages.kwayland
    pkgs.kdePackages.plasma-wayland-protocols
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qttools
    pkgs.darkly
    pkgs.kdePackages.plasma-browser-integration
    pkgs.utterly-round-plasma-style
    pkgs.volantes-cursors
  ];
  stylix.targets = {
    qt = {
      enable = true;
      platform = qtPlatform;
    };
    kde = {
      enable = false;
      useWallpaper = false;
      decorations = "Utterly-Round-Dark-Solid";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = qtPlatform;
    style = {
      package = [
        pkgs.darkly-qt5
        pkgs.darkly
      ];
    };
  };

  # xdg.configFile."kdeglobals".text = lib.mkAfter ''
  #   [KDE]
  #   widgetStyle=${plasmaStyle}
  #   [General]
  #   ColorScheme=${config.lib.stylix.colors.scheme}
  #   BrowserApplication=${defaultBrowser}
  #   [Sounds]
  #   Enable=false
  #   Theme=nothing
  # '';
}
