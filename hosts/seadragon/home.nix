{
  username,
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../common/home.nix
  ];
  home-manager = {
    sharedModules = [
      inputs.stylix.homeModules.stylix
      inputs.plasma-manager.homeModules.plasma-manager
    ];
    users."${username}" = import ../../home/seadragon.nix;
  };
}
