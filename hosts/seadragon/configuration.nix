# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{hostName, ...}:
{

  imports = [
    ../../common
    ../../display/plasma.nix
  ];

  networking.hostName = hostName; # Define your hostname.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
