{ lib, config, ... }: {
  programs.starship = {
    enable = true;
    enableInteractive = true;
    settings = import ../../shared/starship.nix { inherit lib config; };
  };
}
