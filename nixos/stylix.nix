{
  pkgs,
  config,
  lib,
  ...
}:
{
  stylix = {
    enable = true;
    targets = {
      firefox.profileNames = lib.mkIf config.programs.firefox.enable [ "dev-edition-default" ];
    };
  };
  environment.systemPackages = [
    pkgs.rose-pine-cursor
    pkgs.adwaita-icon-theme
    pkgs.hicolor-icon-theme
  ];
  xdg.icons.enable = true;
  gtk.iconCache.enable = true;
}
