{
  lib,
  inputs,
  system,
  username,
  ...
}:
{
  # You can import other NixOS modules here
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs username system;
    };
    backupFileExtension = lib.mkOverride 100 "hm-backup";
    users."${username}" = import ../home;
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
    useUserPackages = true;
  };

    home.stateVersion = "25.05";
}
