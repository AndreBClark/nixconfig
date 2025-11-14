{
  lib,
  username,
  ...
}:
{
  imports = [
    ./nixpkgs.nix
    ./programs
    ./terminal
    ./workspace
    ./theme
    ./cli
  ];
  programs.git.enable = lib.mkForce true;
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
