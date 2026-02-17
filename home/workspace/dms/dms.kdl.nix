{
  xdg.configFile."niri/dms/includes.kdl".source = builtins.fetchurl {
    url = "https://github.com/AvengeMedia/DankMaterialShell/blob/master/core/internal/config/e
mbedded/niri.kdl";
    hash = "sha256-R4eBBY/COi9pp/0/CP0xDAn0CO1+OHZOPJdiI+sZq1k=";
  };
}
