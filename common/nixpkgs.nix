{lib, inputs, system, ...}:
{
  nixpkgs = {
    # Configure your nixpkgs instance
    hostPlatform = lib.mkDefault "x86_64-linux";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}