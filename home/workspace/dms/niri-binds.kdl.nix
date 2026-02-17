{
  xdg.configFile = {
    "niri/dms/binds.kdl".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/AvengeMedia/DankMaterialShell/e2c3ff00fbf05c33909f60bf6c148e2f156fdbc2/core/inte
rnal/config/embedded/niri-binds.kdl";
      sha256 = "sha256-DWCKyQtPqwTfh8GH8Bk2cOyDlnes0ucr9WrkRh9Cn7A=";
    };
  };
}
