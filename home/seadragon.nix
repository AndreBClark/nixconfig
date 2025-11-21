{ inputs, ... }:
{
  imports = [
    ./default.nix
    ./programs
    ./terminal
    ./theme
    ./workspace
    ./cli
  ];
}
