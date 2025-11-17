{ inputs, ... }:
{
  imports = [
    ./default.nix
    ./programs
    ./terminal
    ./workspace
    ./theme
    ./cli
  ];
}
