{
  lib,
  pkgs,
  config,
  ...
}:
with config.lib.stylix;
with config.stylix;
let
  radius = "12";
  gap = "16";
  inset = "-${gap}";
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
        // Optional: Include DMS-generated configs for theming
        include "dms/binds.kdl"
        include "dms/colors.kdl"
        include "dms/layout.kdl"
        include "dms/alttab.kdl"
        include "dms/wpblur.kdl"

        prefer-no-csd

        layout {
          gaps ${gap}
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

        ${import ./bindings.nix}
        ${import ./window-rules.nix { inherit radius; }}

      '';
    };
  };
}
