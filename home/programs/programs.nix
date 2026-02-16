{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
  ];
}
