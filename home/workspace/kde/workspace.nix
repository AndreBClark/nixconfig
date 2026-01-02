{
  lib,
  config,
  ...
}:
{
  programs.plasma.workspace = {
    theme = lib.mkForce "Utterly-Round-Solid";
    colorScheme = lib.concatStrings (
      lib.filter lib.isString (builtins.split "[^a-zA-Z]" config.lib.stylix.colors.scheme)
    );
    widgetStyle = lib.mkForce "Darkly";
    windowDecorations = {
      theme = "Utterly-Round-Dark-Solid";
      library = "org.kde.kwin.aurorae";
    };
    iconTheme = config.stylix.icons.dark;
    clickItemTo = "select";
    cursor = {
      cursorFeedback = "Static";
      animationTime = 2;
      theme = "volantes_cursors";
      size = 24;
      taskManagerFeedback = true;
    };
    soundTheme = lib.mkForce "nothing";
    enableMiddleClickPaste = true;
    splashScreen.theme = lib.mkForce "None";
    wallpaper = null;
    # wallpaperFillMode = "preserveAspectCrop";
    # wallpaperSlideShow = {
    #   path = ./. + "~/Pictures/";
    #   interval = 300;
    # };
  };
}
