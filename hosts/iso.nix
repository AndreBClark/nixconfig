{ config, pkgs, lib, modulesPath, targetSystem, ... }:
{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    (modulesPath + "/installer/cd-dvd/channel.nix")
  ];



  isoImage.isoName = "${config.isoImage.isoBaseName}-${config.system.nixos.label}-${pkgs.stdenv.hostPlatform.system}.iso";
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;
  isoImage.squashfsCompression = "zstd -Xcompression-level 15"; # xz takes forever


  # configure proprietary drivers
  nixpkgs.config.allowUnfree = true;
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # programs that should be available in the installer
  environment.systemPackages = with pkgs; [
    fish
    git
  ];
  system.stateVersion = "24.05";
}
