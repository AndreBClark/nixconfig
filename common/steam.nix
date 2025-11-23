{
  pkgs,
  username,
  ...
}:
{
  environment.systemPackages = [
    pkgs.xwayland
    pkgs.samrewritten
    (pkgs.callPackage ../pkgs/sgdboop/package.nix {})
  ];
  programs.xwayland.enable = true;
  programs.steam = {
    enable = true;
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
    ];
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    gamescopeSession.enable = true;
  };
  programs.gamescope = {
    enable = true;
  };
  programs.gamemode.enable = true;
  services.getty.autologinUser = username;
}
