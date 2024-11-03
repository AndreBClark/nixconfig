{lib, ...}:
{
  services.xserver = {
    enable = lib.mkDefault true;
    xkb.layout = lib.mkDefault "us";
  };
  # boot.kernelParams = [
  #   "nvidia-drm.fbdev=1"
  #   "NVreg_EnableGpuFirmware=0"
  # ];
  # You may need to comment out "services.displayManager.gdm.enable = true;"

  services.desktopManager.plasma6.enable = true;
}
