{pkgs, system ? "x86_64-linux", ...}:{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = ""
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.base24-schemes = callPackage ./base24-schemes/package.nix;
    packages.${system}.rofi-themes = callPackage ./rofi-launchers/package.nix;
    packages.${system}.sgdboop = callPackage ./sgdboop/package.nix;
    packages.x86_64-linux.default = [
      packages.${system}.base24-schemes
      packages.${system}.rofi-themes
      packages.${system}.sgdboop
    ];

  };
}
