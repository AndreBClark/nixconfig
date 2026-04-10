{
  inputs,
  config,
  ...
}:
{
  imports =
    builtins.attrValues {
      inherit (inputs.hardware.nixosModules)
        common-cpu-intel
        common-pc-ssd
        common-gpu-nvidia-nonprime
        ;
    }
    ++ [
      "${inputs.hardware}/common/gpu/nvidia/pascal"
    ];

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
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
