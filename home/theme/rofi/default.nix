{ pkgs, ... }:
let
  colorscheme = "catppuccin";
in
{
  home.packages = [
    pkgs.icomoon-feather
    (pkgs.callPackage ../../../pkgs/rofi-launchers/package.nix {
      theme = colorscheme;
      launcher.style = "style-7";
      powermenu.style = "style-5";
    })
  ];
  xdg.desktopEntries = {
    powermenu = {
      name = "powermenu";
      type = "Application";
      exec = ''powermenu_t2'';
      terminal = false;
      startupNotify = false;
      icon = "nix-snowflake-white";
    };
  };
}
