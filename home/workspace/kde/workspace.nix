{
  lib,
  config,
  ...
}:
{
  programs.plasma.workspace = {
    # lookAndFeel = "Catppuccin-Mocha-Sky";
    theme = lib.mkForce "Utterly-Round";
    colorScheme = config.lib.stylix.colors.scheme;
    clickItemTo = "select";
    # cursor.theme = config.stylix.cursor.name;
    # cursor.size = config.stylix.cursor.size;
    iconTheme = config.stylix.icons.dark;
    soundTheme = lib.mkForce "nothing";
    enableMiddleClickPaste = true;
    splashScreen.theme = "None";
    wallpaperSlideShow.path = ./. + "~/Pictures/";
  };
}
