{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono" ];
  };

  home.packages = with pkgs; [
    google-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}