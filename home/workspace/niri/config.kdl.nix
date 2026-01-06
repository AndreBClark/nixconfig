{
  lib,
  pkgs,
  config,
  ...
}:
with config.lib.stylix;
with config.stylix;
let
  gaps = "16";
  inset = "-${toString (lib.toIntBase10 gaps - 2)}";
in
{
  home.packages = [
    pkgs.volantes-cursors
  ];
  xdg.configFile = {
    "niri/default-config.kdl".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/YaLTeR/niri/refs/heads/main/resources/default-config.kdl";
      sha256 = "sha256-TS+DmRYcTynDsMpQ5ZQQl9n8jjc7JhKnCz0j1s1WaxU=";
    };
    "niri/dms/binds.kdl".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/AvengeMedia/DankMaterialShell/refs/heads/stable/core/internal/config/embedded/niri-binds.kdl";
      sha256 = "sha256-XGuBIKJDMJJBYGykFdOJ1XsyXy7Qq2OaRUewCjKz+sE=";
    };

    "niri/config.kdl" = {
      text = lib.mkAfter ''
        include "default-config.kdl"
        include "dms/binds.kdl"
        include "dms/colors.kdl"
        include "dms/layout.kdl"
        include "dms/alttab.kdl"
        include "dms/wpblur.kdl"
        spawn-at-startup "dms" "run" "-d"
        prefer-no-csd
        output "DP-2" {
            focus-at-startup
          }
        output "HDMI-A-1" {
          position x=0 y=0
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
        cursor {
          xcursor-theme "default"
          xcursor-size ${toString cursor.size}
        }

        ${import ./binds.nix}
        ${import ./window-rules.nix}

      '';
    };
  };
}
