{
  username,
  system,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
