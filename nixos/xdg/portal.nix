{ pkgs, ... }:
let
  portals =
    builtins.attrValues {
      inherit (pkgs)
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        ;
    }
    ++ [ pkgs.kdePackages.xdg-desktop-portal-kde ];
in
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = portals;
    configPackages = portals;
  };
}
