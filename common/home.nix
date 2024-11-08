{
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
    backupFileExtension = "backup";
    users."${username}" = import ../home;
    sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  };
}
