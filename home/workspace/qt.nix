{ lib, pkgs, ... }:
let
  qtPlatform = "qtct";
in
{
  home.packages = [
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qttools
  ];

  qt = {
    enable = true;
  };
  stylix.targets.qt = {
    enable = true;
    platform = qtPlatform;
  };
}
