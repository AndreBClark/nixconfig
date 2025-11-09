{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    with kdePackages;
    [
      # adwaita-qt
#      qt5ct
      wayland
      kwin
      # wayqt
      xwayland
      kwayland
      plasma-wayland-protocols
      qt5.qtwayland
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
      iconTheme = "Dracula";
      enableMiddleClickPaste = true;
      wallpaper =
      "/home/andrec/nixconfig/fallingfrontier.jpg";
    };
    fonts = {
      general = {
        family = "Inter";
        pointSize = 12;
        styleHint = "sansSerif";
      };
      fixedWidth = {
        family= "JetBrains Mono";
        pointSize = 12;
        styleHint = "monospace";
      };
      menu = {
        family = "Inter";
        styleHint = "sansSerif";
        pointSize = 10;
      };
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
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
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    #
    # Some mid-level settings:
    #
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
    powerdevil = {
      AC = {
        powerButtonAction = null;
      };
    };
    #
    # Some low-level settings:
    #
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

  ##

}
