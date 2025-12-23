{ username
, inputs
, pkgs
, ...
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
  home-manager = {
    sharedModules = [
      inputs.vicinae.homeManagerModules.default
      inputs.plasma-manager.homeModules.plasma-manager
      inputs.dms.homeModules.dankMaterialShell.default
      inputs.dms.homeModules.dankMaterialShell.niri
    ];
    users."${username}" = import ../../home/seadragon.nix;
  };
}
