{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    (import ./vicinae.nix { inherit pkgs inputs config; })
  ];
}
