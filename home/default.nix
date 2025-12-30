{
  lib,
  ...
}:
{
  imports = [
    ./config.nix
    ./releasechecks.nix
  ];

  programs.git.enable = lib.mkForce true;

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  home.stateVersion = lib.mkForce "24.05";
}
