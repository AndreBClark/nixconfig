{ lib, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = lib.mkDefault false;
  };
}
