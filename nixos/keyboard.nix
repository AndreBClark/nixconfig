{ config, ... }:
{
  services.xserver = {
    xkb = {
      inherit (config.keyboard) layout options model;
    };
  };
}
