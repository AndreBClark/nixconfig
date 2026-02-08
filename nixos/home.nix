{
  lib,
  inputs,
  system,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs system;
    };
    sharedModules = [
      ../variables
    ];
    backupFileExtension = lib.mkOverride 100 "hm-backup";
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}
