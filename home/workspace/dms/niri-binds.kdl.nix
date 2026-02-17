{
  xdg.configFile = {
    "niri/dms/binds.kdl".source = builtins.fetchurl {
      url = "https://github.com/AvengeMedia/DankMaterialShell/blob/master/core/internal/config/embedded/niri-binds.kdl";
      hash = "sha256-5AEDsBTshQK1kP2oPefQSIzEVU8Yz43PGsWe9GPip/I=";
    };
  };
}
