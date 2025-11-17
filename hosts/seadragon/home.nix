{
  username,
  system,
  inputs,
  lib,
  specialArgs,
  ...
}:
{
  imports = [ ../../common/home.nix ];

  home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
  home-manager.users."${username}" = import ../../home/seadragon.nix;
}
