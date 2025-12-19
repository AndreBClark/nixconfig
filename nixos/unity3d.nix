{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dotnetCorePackages.sdk_9_0
    pkgs.unityhub
  ];
}
