{
  services.xserver.enable = true;
  # boot.kernelParams = [
  #   "nvidia-drm.fbdev=1"
  #   "NVreg_EnableGpuFirmware=0"
  # ];
  # You may need to comment out "services.displayManager.gdm.enable = true;"
  services.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  services.desktopManager.plasma6.enable = true;
}