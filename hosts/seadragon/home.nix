{
  username,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../nixos/home.nix
    ../../home/theme/stylix/theme.nix
  ];
  environment.systemPackages = [
    pkgs.dracula-icon-theme
  ];

  stylix.enableReleaseChecks = false;
  home-manager = {
    sharedModules = [
      inputs.vicinae.homeManagerModules.default
      inputs.plasma-manager.homeModules.plasma-manager
    ];

    users."${username}" = import ../../home/seadragon.nix;
  };
}
