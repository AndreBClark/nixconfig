{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono" ];
  };

  home.packages = with pkgs; [
    google-fonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "FiraCode"
      ];
    })
  ];
}