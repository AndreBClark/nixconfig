{
  pkgs,
  lib,
  config,
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
      qt6ct
      qtwayland
      qttools
      darkly
      plasma-browser-integration
      utterly-round-plasma-style
    ];

  stylix.targets = {
    qt = {
      enable = false;
      platform = "kde";
    };
    kde = {
      enable = false;
      useWallpaper = true;
      decorations = "Utterly-Round";
    };
  };
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
    # immutableByDefault = true;
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
        KDE = {
          widgetStyle = lib.mkForce "Darkly";
        };
        "General" = {
          "BrowserApplication" = "vivaldi";
        };
      };
      klaunchrc = {
        # No bouncy cursor
        BusyCursorSettings.Bouncing = false;
        FeedbackStyle.BusyCursor = false;
      };
    };

    #
    # Some high-level settings:
    #
    workspace = {
      # lookAndFeel = "Catppuccin-Mocha-Sky";
      theme = lib.mkForce "Utterly-Round";
      colorScheme = "CatppuccinMochaSky";
      clickItemTo = "select";
      cursor.theme = config.stylix.cursor.name;
      cursor.size = config.stylix.cursor.size;
      iconTheme = config.stylix.icons.dark;
      wallpaper = config.stylix.image;
      soundTheme = lib.mkForce "nothing";
      enableMiddleClickPaste = true;
      splashScreen.theme = "None";
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    hotkeys.commands = {
      "launch-rofi" = {
        name = "Launch Rofi";
        key = "Meta";
        command = "launcher_t2";
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
            name = "org.kde.plasma.quicklaunch";
            config.General.launcherUrls = [
              "file:///etc/profiles/per-user/${username}/share/applications/powermenu.desktop"
            ];
          }
          "org.kde.plasma.pager"
          "org.kde.plasma.showdesktop"
          "org.kde.plasma.panelspacer"
          {
            iconTasks = {
              launchers = [
                "applications:systemsettings.desktop"
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
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.appmenu"
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
        "Log Out" = "Ctrl+Alt+Del";
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };
    fonts = {
      general = {
        family = config.stylix.fonts.monospace.name;
        pointSize = 12;
        styleHint = "monospace";
      };
      fixedWidth = {
        family = config.stylix.fonts.monospace.name;
        pointSize = 12;
        styleHint = "monospace";
      };
      menu = {
        family = config.stylix.fonts.monospace.name;
        pointSize = 10;
        styleHint = "monospace";
      };
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
