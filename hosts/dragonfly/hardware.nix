{inputs, ... }:
{
  imports = [
      inputs.hardware.nixosModules.dell-xps-15-9560
  ];
  services.upower.enable = true;
}
