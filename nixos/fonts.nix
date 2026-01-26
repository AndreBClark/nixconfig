{
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
    packages = with pkgs.nerd-fonts; [
      jetbrains-mono
      fira-code
      pkgs.noto-fonts
      pkgs.noto-fonts-color-emoji
    ];
  };
}
