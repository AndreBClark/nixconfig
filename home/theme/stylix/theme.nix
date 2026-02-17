{
  pkgs,
  lib,
  config,
  ...
}:
let
  theme = {
    colorscheme = "tokyo-night";
    variant = "moon";
    wallpaper = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/AndreBClark/nixconfig/7a91f0364061518fdf1d6e721508288521d15984/fallingfrontier.jpg";
      sha256 = "1nadjcyx357md29mj02cx1f62g1v1b5jhcyfxr3g5v9ji822fdix";
    };
  };
in
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme.colorscheme}-${theme.variant}.yaml";
    opacity = {
      desktop = 1.0;
      popups = 1.0;
      applications = 1.0;
    };
    icons = {
      enable = true;
      dark = lib.mkForce "Dracula";
      light = config.stylix.icons.dark;
      package = pkgs.dracula-icon-theme;
    };
    cursor = {
      name = "Volantes Cursors";
      package = pkgs.volantes-cursors;
      size = 24;
    };
    image = theme.wallpaper;
    polarity = "dark";
  };
}
