{ config, ... }:
{
  programs.niri.enable = true;
  services.displayManager = {
    sddm.enable = false;
    dms-greeter = {
      enable = true;
      compositor.name = "niri";
      logs.save = true;
      configHome = "/home/${config.username}";
    };
  };
}
