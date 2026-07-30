{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      mpv
      ffmpeg
      discord
      playerctl
      pavucontrol
      unzip
      audacity
      shared-mime-info
      pandoc
      ;
  };
}
