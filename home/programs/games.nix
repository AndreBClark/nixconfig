{ pkgs, ... }:
let
  inherit (pkgs) starsector beyond-all-reason;
in
{
  home.packages = [
    starsector
    beyond-all-reason
  ];
}
