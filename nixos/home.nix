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
    users.root = import ../home/root.nix;
    sharedModules = [
      ../variables
    ];
    backupFileExtension = lib.mkOverride 100 "hm-backup";
    overwriteBackup = true;
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}
