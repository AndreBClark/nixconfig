{
  pkgs,
  inputs,
  lib,
  username,
  ...
}:
{
  home.packages =
    with pkgs;
    with kdePackages;
    [
      wayland
      #       wayqt
      kwin
      xwayland
      kwayland
      plasma-wayland-protocols
      qtstyleplugin-kvantum
      libsForQt5.qt5ct
      qt6ct
      qtwayland
      qttools
      plasma-browser-integration
      utterly-round-plasma-style
    ];

  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style = {
      package = [
        pkgs.darkly-qt5
        pkgs.darkly
      ];
    };
  };
  programs.plasma = {
    enable = true;
    immutableByDefault = true;
    # overrideConfig = true;
    # Some low-level settings:
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."Desktops"."Number" = {
        value = 2;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      kdeglobals = {
        KDE = {
          widgetStyle = lib.mkForce "Darkly";
        };
        "General"."BrowserApplication" = "vivaldi";
      };
    };
    #
    # Some high-level settings:
    #
    workspace = {
      lookAndFeel = "Catppuccin-Mocha-Sky";
      theme = lib.mkForce "Utterly-Round";
      colorScheme = "CatppuccinMochaSky";
      clickItemTo = "select";
      cursor.theme = "catppuccin-mocha-sky-cursors";
      cursor.size = 24;
      iconTheme = "Dracula";
      soundTheme = lib.mkForce "nothing";
      enableMiddleClickPaste = true;
      wallpaper = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/AndreBClark/nixconfig/7a91f0364061518fdf1d6e721508288521d15984/fallingfrontier.jpg";
        sha256 = "1nadjcyx357md29mj02cx1f62g1v1b5jhcyfxr3g5v9ji822fdix";
      };
    };
    fonts = {
      general = {
        family = "JetBrains Mono";
        pointSize = 12;
        styleHint = "monospace";
      };
      fixedWidth = {
        family = "JetBrains Mono";
        pointSize = 12;
        styleHint = "monospace";
      };
      menu = {
        family = "JetBrains Mono";
        pointSize = 10;
        styleHint = "monospace";
      };
    };
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    hotkeys.commands = {
      "launch-rofi" = {
        name = "Launch Rofi";
        key = "Meta";
        command = "rofi -show combi";
      };
      "launch-filebrowser" = {
        name = "Launch File Browser";
        key = "Meta+f";
        command = "rofi -show file-browser-extended";
      };
    };
    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        height = lib.mkForce 48;
        opacity = "opaque";
        widgets = [
          {
            iconTasks = {
              launchers = [
                "applications:rofi.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:code.desktop"
                "applications:kitty.desktop"
                "applications:spotify.desktop"
                "applications:vivaldi-stable.desktop"
                "applications:firefox-devedition.desktop"
                "applications:steam.desktop"
              ];
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.marginsseparator"
          { systemTray.items.hidden = [ "org.kde.plasma.brightness" ]; }
          {
            name = "org.kde.plasma.digitalclock";
            config.Appearance = {
              dateFormat = "custom";
              customDateFormat = "MM-dd ddd";
            };
          }
        ];
      }
    ];

    #
    # Some mid-level settings:
    #
    startup.startupScript = {
      steam.text = "steam -silent";
    };
    shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+Ctrl+Alt+L"
        ];
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };
    kscreenlocker.autoLock = false;
    powerdevil = {
      AC = {
        powerButtonAction = lib.mkForce "nothing";
        autoSuspend = {
          action = "sleep";
          idleTimeout = 60 * 60;
        };
        whenSleepingEnter = "hybridSleep";
      };
    };
    window-rules = [
      {
        apply.noborder = {
          value = true;
          apply = "initially";
        };
        description = "Hide titlebar by default";
        match.window-class = {
          value = ".*";
          type = "regex";
        };
      }
    ];
  };
  xdg.configFile."mime/packages/inode-directory.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
      <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
      <mime-type type="inode/directory">
          <comment>Folder</comment>
          <icon name="folder"/>
          <glob-deleteall/>
      </mime-type>
    </mime-info>'';
}
