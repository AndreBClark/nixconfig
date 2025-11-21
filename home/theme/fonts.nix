{
  pkgs,
  config,
  ...
}:
{
  stylix = {
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
    };
    targets = {
      font-packages.enable = true;
      fontconfig.enable = true;
    };
  };
  home.packages = with pkgs; [
    # google-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
