{
  xdg.configFile = {
    "niri/default-config.kdl".source = builtins.fetchurl {
      url = "https://github.com/niri-wm/niri/blob/main/resources/default-config.kdl";
      hash = "sha256-Dxhu0qPtoWl/b2K6A8hwSDGAAlw6yTCPsBDb3b07S5U=";
    };
  };
}
