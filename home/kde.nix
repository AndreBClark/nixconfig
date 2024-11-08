{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    with libsForQt5;
    with kdePackages;
    [
      # adwaita-qt
      qt5ct
      wayland
      kwin
      wayqt
      kwayland
      plasma-wayland-protocols
      qt5.qtwayland
      # qtstyleplugin-kvantum
      qt6ct
      qtwayland
      plasma-browser-integration
    ];

  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  programs.plasma = {
    enable = true;
    #
    # Some high-level settings:
    #
    workspace = {
      colorScheme = "CatppuccinMochaSky";
      clickItemTo = "select";
      lookAndFeel = "Catppuccin-Mocha-Sky";
      cursor.theme = "catppuccin-mocha-sky-cursors";
      iconTheme = "Dracula";
      enableMiddleClickPaste = true;
      wallpaper =
      "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
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
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };
  };
}
