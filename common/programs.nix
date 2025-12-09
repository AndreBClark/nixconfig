{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-dev-edition;
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    search.enable = true;
    flake = "/home/andrec/nixconfig/"; # sets NH_OS_FLAKE variable for you
  };
  programs.defaultBrowser = "vivaldi";
}
