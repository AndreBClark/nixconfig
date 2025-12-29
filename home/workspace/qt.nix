{ pkgs, ... }:
let
  qtPlatform = "qtct";
in
{
  qt = {
    enable = true;
    platformTheme.name = qtPlatform;
    style = {
      package = [
        pkgs.darkly-qt5
        pkgs.darkly
      ];
    };
  };
  stylix.targets.qt = {
    enable = true;
    platform = qtPlatform;
  };
}
