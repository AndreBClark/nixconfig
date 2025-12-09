{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    ./default.nix
    ./theme
    (import ./services { inherit pkgs inputs config; })
    ./programs
    ./terminal
    ./workspace
    ./cli
  ];
}
