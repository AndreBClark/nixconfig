{
  xdg.configFile."niri/dms-includes.kdl".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/AvengeMedia/DankMaterialShell/e2c3ff00fbf05c33909f60bf6c148e2f156fdbc2/core/inte
rnal/config/embedded/niri.kdl";
    sha256 = "sha256-W2aRKkSTIXj80Ppv21Guj2L+09589ztLKbeeSToW79A=";
  };
}
