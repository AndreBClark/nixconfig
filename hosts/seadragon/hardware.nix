{
  inputs,
  config,
  ...
}:
{
  imports = with inputs.hardware.nixosModules; [
    common-cpu-intel
    common-pc-ssd
    common-gpu-nvidia-nonprime
  ];

  # security.rtkit.enable = true;
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    pulseaudio.enable = false;

    pipewire = {
      # Enable sound with pipewire.
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
    "nvidia.NVreg_EnableGpuFirmware=0"
  ];

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
