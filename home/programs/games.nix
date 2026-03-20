{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs) heroic starsector beyond-all-reason;
  };
}
