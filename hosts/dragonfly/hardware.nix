{inputs, pkgs, ... }:
{
  imports = [
      inputs.hardware.nixosModules.dell-xps-15-9560
  ];
  hardware.bluetooth.enable = true;
  services = {
    upower.enable = true;
    blueman.enable = true;
    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse
  ];
}
