{
  pkgs,
  lib,
  config,
  ...
}:
let
  theme = {
    colorscheme = "catppuccin";
    accent = "sky";
    flavor = "mocha";
    wallpaper = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/AndreBClark/nixconfig/7a91f0364061518fdf1d6e721508288521d15984/fallingfrontier.jpg";
      sha256 = "1nadjcyx357md29mj02cx1f62g1v1b5jhcyfxr3g5v9ji822fdix";
    };
  };
in
{
  home.packages = [
    pkgs.dracula-icon-theme
  ];
  stylix = {
    enable = true;
    # homeManagerIntegration.followsSystem = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme.colorscheme}-${theme.flavor}.yaml";
    override = {
      base10 = "#181825"; # mantle - darker background
      base11 = "#11111b"; # crust - darkest background
      base12 = "#eba0ac"; # maroon - bright red
      base13 = "#f5e0dc"; # rosewater - bright yellow
      base14 = "#a6e3a1"; # green - bright green
      base15 = "#89dceb"; # sky - bright cyan
      base16 = "#74c7ec"; # sapphire - bright blue
      base17 = "#f5c2e7"; # pink - bright purple
    };
    icons = {
      enable = true;
      dark = lib.mkForce "Dracula";
      light = config.stylix.icons.dark;
      package = pkgs.dracula-icon-theme;
    };
    cursor = with theme; {
      name = "${colorscheme}-${flavor}-${accent}-cursors";
      package = pkgs.catppuccin-cursors.mochaSky;
      size = 24;
    };
    image = theme.wallpaper;
    polarity = "dark";
    targets = {
      gtk.enable = false;
      gnome.enable = false;
      rofi.enable = false;
      firefox.profileNames = [ "dev-edition-default" ];
      gnome-text-editor.enable = lib.mkForce false;
      nixvim.plugin = "base16-nvim";
    };
  };
}
