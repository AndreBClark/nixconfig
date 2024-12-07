{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    with libsForQt5;
    with kdePackages;
    [
      # adwaita-qt
#      qt5ct
      wayland
      kwin
      # wayqt
      kwayland
      plasma-wayland-protocols
      qt5.qtwayland
      qtstyleplugin-kvantum
      qt6ct
      qtwayland
      plasma-browser-integration
    ];

  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
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
      # wallpaper =
      # "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
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
                "applications:org.kde.konsole.desktop"
                "applications:alacritty.desktop"
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
}
