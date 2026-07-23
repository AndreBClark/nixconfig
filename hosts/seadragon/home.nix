{
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../nixos/home.nix
    ../../home/theme/stylix/theme.nix
  ];

  home-manager = {
    users."${config.username}" = import ../../home/seadragon.nix;
  };
}
