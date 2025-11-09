{ pkgs ? import <nixpkgs> {}, nodePackages ? pkgs.nodePackages }:
pkgs.mkShell {
  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
    alias run='pnpm run'
  '';
  nativeBuildInputs = with pkgs; with nodePackages; [
    pkg-config
    python3
    nodejs
    node-gyp
    node-gyp-build
  ];
  buildInputs = with pkgs; with nodePackages; [
    deno
    pnpm
    vips
    typescript
    typescript-language-server
  ];
}
