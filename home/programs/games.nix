{ pkgs, ... }:
{
  home.packages = with pkgs; [
    starsector
    vintagestory
  ];
}
