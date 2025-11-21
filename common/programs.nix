{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mono
    unityhub
    nh
  ];
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    search.enable = true;
    flake = "/home/andrec/nixconfig/"; # sets NH_OS_FLAKE variable for you
  };
  programs.defaultBrowser = "vivaldi";
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    dotnet-runtime-wrapped-7
    .0
    .20
    dotnet-runtime-7
    .0
    .20
  ];
}
