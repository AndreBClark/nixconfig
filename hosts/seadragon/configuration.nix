{ hostName, ... }:
{
  imports = [
    ../../nixos
    ./programs.nix
    ../../display/niri.nix
    ../../display/plasma.nix
  ];

  networking.hostName = hostName; # Define your hostname.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
