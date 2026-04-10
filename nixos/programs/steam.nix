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
        steamtinkerlaunch
        ;
    };
    sessionVariables = {
      XCURSOR_THEME = "volantes-cursors";
      XCURSOR_SIZE = "24";
      # PROTON_NO_FSYNC = "1";
      # PROTON_NO_ESYNC = "1";
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
      extest.enable = true;
      localNetworkGameTransfers.openFirewall = true;
      extraPackages = builtins.attrValues {
        inherit (pkgs)
          gamescope
          mangohud
          winetricks
          faudio
          dxvk
          lsfg-vk
          volantes-cursors
          ;
      };
      extraCompatPackages = builtins.attrValues {
        inherit (pkgs)
          proton-ge-bin
          steamtinkerlaunch
          steam-play-none
          ;
      };
    };
    gamescope.enable = true;
    xwayland.enable = true;
    gamemode.enable = true;
  };
}
