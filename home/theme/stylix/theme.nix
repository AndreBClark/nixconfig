{
  pkgs,
  lib,
  config,
  ...
}:
let
  theme = {
    colorscheme = "tokyo-night";
    accent = "sky";
    variant = "storm";
    wallpaper = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/AndreBClark/nixconfig/7a91f0364061518fdf1d6e721508288521d15984/fallingfrontier.jpg";
      sha256 = "1nadjcyx357md29mj02cx1f62g1v1b5jhcyfxr3g5v9ji822fdix";
    };
  };
in
{
  stylix = with theme; {
    enable = true;
    # homeManagerIntegration.followsSystem = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colorscheme}-${variant}.yaml";
    override = { };
    icons = {
      enable = true;
      dark = lib.mkForce "Dracula";
      light = config.stylix.icons.dark;
      package = pkgs.dracula-icon-theme;
    };
    # cursor = {
    #   #   name = "${colorscheme}-${flavor}-${accent}-cursors";
    #   #   package = pkgs.catppuccin-cursors.mochaSky;
    #   size = 24;
    # };
    image = theme.wallpaper;
    polarity = "dark";
  };
}
