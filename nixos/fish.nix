{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    promptInit = ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
    '';
  };
  documentation.man.generateCaches = false;
}
