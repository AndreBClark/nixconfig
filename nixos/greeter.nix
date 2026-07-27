{ config, pkgs, ... }:
let
  configHome = "/home/${config.username}";
in
{
  environment.systemPackages = [ pkgs.rose-pine-cursor ];
  programs.niri.enable = true;
  services.displayManager = {
    sddm.enable = false;
    dms-greeter = {
      inherit configHome;
      enable = true;
      compositor = {
        name = "niri";
        customConfig = ''
          hotkey-overlay {
            skip-at-startup
          }
          cursor {
            xcursor-theme "BreezeX-RosePine-Linux"
            xcursor-size 48
          }
          debug {
            disable-cursor-plane
            keep-max-bpc-unchanged
          }
        '';
      };
    };
  };
}
