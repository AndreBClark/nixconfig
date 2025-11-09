{lib, inputs, system, ...}:
{
  nixpkgs = {
    # Configure your nixpkgs instance
    hostPlatform = lib.mkDefault "x86_64-linux";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "dotnet-runtime-wrapped-7.0.20"
        "dotnet-runtime-7.0.20"
      ];
    };
  };
}
