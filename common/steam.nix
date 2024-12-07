{pkgs, inputs, system, username, lib, ...}: {
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
}