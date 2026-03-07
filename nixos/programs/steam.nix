{
  pkgs,
  lib,
  ...
}:
{
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        samrewritten
        sgdboop
        volantes-cursors
        lsfg-vk-ui
        ;
    };
    sessionVariables = {
      XCURSOR_THEME = "volantes-cursors";
      XCURSOR_SIZE = "24";
      PROTON_NO_FSYNC = "1";
      PROTON_NO_ESYNC = "1";
    };
  };

  xdg.icons.fallbackCursorThemes = lib.mkForce [
    "volantes-cursors"
    "volantes_cursors"
    "breeze_cursors"
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      remotePlay.openFirewall = true;
      protontricks.enable = true;
      localNetworkGameTransfers.openFirewall = true;
      extraPackages =
        builtins.attrValues {
          inherit (pkgs)
            gamescope
            mangohud
            lsfg-vk
            winetricks
            volantes-cursors
            ;
        }
        ++ [
          pkgs.winePackages.wayland
        ];
      extraCompatPackages = [
        pkgs.proton-ge-bin
        pkgs.steamtinkerlaunch
      ];
      gamescopeSession.enable = lib.mkDefault false;
    };
    gamescope.enable = true;
    xwayland.enable = true;
    gamemode.enable = true;
  };
}
