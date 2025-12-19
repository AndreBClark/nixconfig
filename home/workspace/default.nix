# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  imports = [
    ./kde
    ./niri
    ./dms
    # ./gtk.nix
  ];
}
