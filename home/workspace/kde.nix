{
  pkgs,
  inputs,
  lib,
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
      qt5.qtwayland
      plasma-wayland-protocols
      qtstyleplugin-kvantum
      qt6ct
      qtwayland
      plasma-browser-integration
    ];

  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  programs.plasma = {
    enable = true;
    #
    # Some high-level settings:
    #
    workspace = {
      theme = "breeze-dark";
      colorScheme = "CatppuccinMochaSky";
      clickItemTo = "select";
      lookAndFeel = "Catppuccin-Mocha-Sky";
      cursor.theme = "catppuccin-mocha-sky-cursors";
      cursor.size = 16;
      iconTheme = "Dracula";
      soundTheme = lib.mkForce null;
      enableMiddleClickPaste = true;
      wallpaper = "/home/andrec/nixconfig/fallingfrontier.jpg";
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
    };
    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          {
            name = "org.kde.plasma.showdesktop";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:code.desktop"
                "applications:kitty.desktop"
                "applications:spotify.desktop"
                "applications:chromium-browser.desktop"
                "applications:firefox-devedition.desktop"
                "applications:steam.desktop"
              ];

            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            name = "org.kde.plasma.digitalclock";
            config.Appearance = {
              dateFormat = "custom";
              customDateFormat = "MM-dd dddd";
            };
          }
        ];
      }
    ];

    #
    # Some mid-level settings:
    #
    startup.startupScript = {
      dunst = {
        text = "dunst &";
      };
      steam = {
        text = "steam -silent";
      };
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
      plasmashell."activate application launcher" = "";

    };
    powerdevil = {
      AC = {
        powerButtonAction = null;
      };
    };
    # Some low-level settings:
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."Desktops"."Number" = {
        value = 2;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };
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
