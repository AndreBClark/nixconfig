{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  name = "web";
  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.python3
    pkgs.node-gyp
    pkgs.node-gyp-build
    pkgs.fish
  ];
  buildInputs = [
    pkgs.nodejs
    pkgs.pnpm
    pkgs.deno
    pkgs.vips
    pkgs.biome
    pkgs.typescript
    pkgs.typescript-language-server
    pkgs.prettier
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc
    pkgs.openssl
    pkgs.zlib
    pkgs.vips
  ];
  NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  BIOME_BINARY = "${pkgs.biome}/bin/biome";
  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
    alias run='pnpm run'
    alias serve='netlify dev:exec'
  '';
}
