# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  ...
}:
{
  programs.git.enable = lib.mkDefault true;
  imports = with inputs; [
    ./nixpkgs.nix
    ./home.nix
    ./kde.nix
    ./programs
    ./terminal
    ./hyprland
    ./theme
    nixvim.homeManagerModules.nixvim
    catppuccin.homeManagerModules.catppuccin
    tokyonight.homeManagerModules.default
    nix-colors.homeManagerModules.default
  ];
}
