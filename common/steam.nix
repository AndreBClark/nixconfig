{pkgs, inputs, system, username, lib, ...}: {
 environment.systemPackages = [
    pkgs.samrewritten
  ];
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
}
