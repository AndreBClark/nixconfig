{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.nix-your-shell ];
  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellInit = ''
      nix-your-shell fish | source
    '';
    vendor.completions.enable = true;
  };
  documentation.man.cache.enable = false;
}
