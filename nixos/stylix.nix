{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    enableReleaseChecks = false;
  };
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      rose-pine-cursor
      adwaita-icon-theme
      hicolor-icon-theme
      ;
  };
  xdg.icons.enable = true;
  gtk.iconCache.enable = true;
}
