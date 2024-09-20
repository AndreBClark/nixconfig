{ pkgs ? import <nixpkgs> {} }:
with pkgs;
with nodePackages;
mkShell {
  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
    alias run='pnpm run'
  '';
  buildInputs = with pkgs; with nodePackages; [
    nodejs
    pnpm
    node-gyp-build
    node-gyp
  ];
}
