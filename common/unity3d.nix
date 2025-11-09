{
  pkgs,
  lib,
  ...
}:
{

  environment.systemPackages = [
    pkgs.dotnetCorePackages.sdk_9_0
    pkgs.unityhub
    pkgs.jetbrains.rider

  ];
}