{ pkgs, ... }:
{

  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };
  xdg.portal = {
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
    ];
    configPackages = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };
}
