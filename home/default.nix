# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  pkgs,
  lib,
  username,
  ...
}:
{
  programs.git.enable = lib.mkDefault true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = lib.mkDefault true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: lib.mkDefault true;
    };
  };
  imports = with inputs; [
    ./git.nix
    nixvim.homeManagerModules.nixvim
    catppuccin.homeManagerModules.catppuccin
    tokyonight.homeManagerModules.default
    nix-colors.homeManagerModules.default
    ./theme.nix
    ./gtk.nix
    ./services.nix
    ./starship.nix
    ./neovim.nix
    ./hypr.nix
    ./spotify.nix
    ./browsers.nix
    ./qt.nix
    ./fonts.nix
  ];


  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    obsidian
    discord
    vscode
    nixpkgs-fmt
    nixfmt-rfc-style
    playerctl
    pavucontrol
    dunst
    nautilus
    unzip
    ocenaudio
    kdenlive
    frei0r
  ];

  programs.vscode.enable = true;
  programs.direnv.enable = true;
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
