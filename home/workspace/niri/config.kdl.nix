{
  lib,
  pkgs,
  ...
}:
let
  gaps = "16";
  inset = "-${toString (lib.toIntBase10 gaps - 2)}";
in
{
  home.packages = [
    pkgs.volantes-cursors
  ];
  xdg.configFile = {
    "niri/config.kdl" = {
      text = lib.mkAfter /* kdl */ ''
        include "dms-includes.kdl"
        include "window-rules.kdl"

        prefer-no-csd
        output "DP-2" {
          focus-at-startup
          variable-refresh-rate on-demand=true
        }
        output "HDMI-A-1" {
          position x=0 y=720
          variable-refresh-rate on-demand=true
        }
        layout {
          gaps ${gaps}
          struts {
              left ${inset}
              right ${inset}
              top ${inset}
              bottom ${inset}
          }
          border {
            width 0
          }
        }
      '';
    };
  };
}
