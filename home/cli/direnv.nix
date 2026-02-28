{ lib, pkgs, ... }:
{
  home.packages = [
    pkgs.devenv
  ];

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
    enableFishIntegration = lib.mkDefault false;
  };
}
