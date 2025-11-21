{ lib, ... }:
{
  nixpkgs = {
    # Configure your nixpkgs instance
    hostPlatform = lib.mkDefault "x86_64-linux";
    config = {
      allowUnfree = lib.mkForce true;
      allowUnfreePredicate = _: lib.mkForce true;
    };
  };
}
