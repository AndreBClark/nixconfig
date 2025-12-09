{
  inputs,
  config,
  ...
}:
{
  imports = with inputs; [
    # If you want to use modules from other flakes (such as nixos-hardware):
    hardware.nixosModules.common-cpu-intel
    hardware.nixosModules.common-pc-ssd
    hardware.nixosModules.common-gpu-nvidia-nonprime
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.pulseaudio.enable = false;

  services.pipewire = {
    # Enable sound with pipewire.
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
    "nvidia.NVreg_EnableGpuFirmware=0"
  ];
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      modesetting.enable = true;
    };
  };
}
