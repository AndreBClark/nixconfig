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
    packages = builtins.attrValues {
      inherit (pkgs.nerd-fonts)
        jetbrains-mono
        fira-code
        ;
      inherit (pkgs)
        noto-fonts-color-emoji
        ;
    };
  };
}
