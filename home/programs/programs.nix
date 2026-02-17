{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      discord
      playerctl
      pavucontrol
      unzip
      ocenaudio
      # kdePackages.kdenlive
      frei0r
      audacity
      obsidian
      shared-mime-info
      ;
  };
}
