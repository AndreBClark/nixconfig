{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      discord
      playerctl
      pavucontrol
      unzip
      audacity
      obsidian
      shared-mime-info
      ;
  };
}
