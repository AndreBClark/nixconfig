{ pkgs ? import <nixpkgs> {} }:
with pkgs;
with nodePackages;
mkShell {
  buildInputs = with pkgs; with nodePackages; [
    nodejs
    pnpm
    netlify-cli
  ];
}
