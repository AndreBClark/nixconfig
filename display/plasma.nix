{lib, ...}:
{
  services.xserver = {
    enable = lib.mkDefault true;
    xkb.layout = lib.mkDefault "us";
  };

  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
