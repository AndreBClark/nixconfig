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
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

}
