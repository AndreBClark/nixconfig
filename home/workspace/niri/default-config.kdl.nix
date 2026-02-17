{
  xdg.configFile = {
    "niri/default-config.kdl".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/niri-wm/niri/refs/heads/main/resources/default-config.kdl";
      sha256 = "sha256-AcRNVB6aN3Z4hr1cv83PPoQA7SzZlg4mE2vRCGVoZIc=";

    };
  };
}
