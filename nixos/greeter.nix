{ config, ... }:
let
  configHome = "/home/${config.username}";
in
{
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
            xcursor-theme "volantes_cursors"
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
