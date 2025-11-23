{
  lib,
  username,
  ...
}:
{
  programs.plasma.panels = [
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
}
