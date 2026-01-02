{ lib, pkgs, ... }:
let
  qtPlatform = "kde";
in
{
  home.packages = [
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qttools
  ];

  qt = {
    enable = true;
    platformTheme.name = lib.mkForce qtPlatform;
    style = {
      package = [
        pkgs.darkly
        pkgs.darkly-qt5
      ];
    };
  };
  stylix.targets.qt = {
    enable = false;
    platform = qtPlatform;
  };
}
