{ config }:{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    # NVIDIA drivers are unfree.
    videoDrivers = [ "nvidia" ];
  };
  hardware.nvidia = {
    # Enable modesetting for Wayland compositors (hyprland)
    modesetting.enable = true;
    # Use the open source version of the kernel module (for driver 515.43.04+)
    open = false;
    # Enable the Nvidia settings menu
    nvidiaSettings = true;
    # Select the appropriate driver version for your specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  # Enable sound with pipewire.
  services.pipewire = {
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
