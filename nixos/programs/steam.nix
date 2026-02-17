{
  pkgs,
  lib,
  ...
}:
{
  environment = {
    systemPackages = [
      pkgs.xwayland
      pkgs.samrewritten
      pkgs.sgdboop
      pkgs.xsettingsd
      pkgs.xrdb
      pkgs.steamtinkerlaunch
      pkgs.volantes-cursors
    ];
  };
  xdg.icons.fallbackCursorThemes = lib.mkForce [
    "volantes_cursors"
    "breeze_cursors"
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraPackages = [
        pkgs.gamescope
        pkgs.gamemode
        pkgs.openssl
        pkgs.nghttp2
        pkgs.libidn2
        pkgs.rtmpdump
        pkgs.libpsl
        pkgs.curl
        pkgs.krb5
        pkgs.keyutils
        pkgs.lsfg-vk
        pkgs.lsfg-vk-ui
        pkgs.volantes-cursors
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
  # services.getty.autologinUser = username;
}
