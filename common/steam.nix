{
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.xwayland
    pkgs.samrewritten
    (pkgs.callPackage ../pkgs/sgdboop.nix {})
  ];
  programs.xwayland.enable = true;
  programs.steam = {
    enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
    extraPackages = [
      pkgs.gamescope
      pkgs.gamemode
    ];
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
}
