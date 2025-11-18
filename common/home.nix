{
  lib,
  inputs,
  system,
  username,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs username system;
    };
    backupFileExtension = lib.mkOverride 100 "hm-backup";
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}
