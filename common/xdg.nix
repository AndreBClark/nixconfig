{
  pkgs,
  ...
}:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    config = {
      common.default = [ "gtk" ];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      libsForQt5.xdg-desktop-portal-kde
      kdePackages.xdg-desktop-portal-kde
    ];
  };
}
