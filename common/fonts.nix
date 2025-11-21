{
  pkgs,
  inputs,
  lib,
  system,
  config,
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
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-color-emoji
    ];
  };
}
