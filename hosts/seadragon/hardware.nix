{ inputs, config, lib, ... }:
{
  imports = with inputs; [
    # If you want to use modules from other flakes (such as nixos-hardware):
    hardware.nixosModules.common-cpu-intel
    hardware.nixosModules.common-pc-ssd
    hardware.nixosModules.common-gpu-nvidia
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.pulseaudio.enable = false;
  services.xserver.videoDrivers = [ "nvidia" ];

  services.pipewire = {
    # Enable sound with pipewire.
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    # Enable modesetting for Wayland compositors (hyprland)
    modesetting.enable = true;
    # Use the open source version of the kernel module (for driver 515.43.04+)
    open = false;
    # Enable the Nvidia settings menu
    nvidiaSettings = true;
    prime.offload = {
      enable = false;
      enableOffloadCmd = false;
    };
    # Select the appropriate driver version for your specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

}
