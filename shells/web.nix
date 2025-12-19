{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  name = "web";
  buildInputs = with pkgs.nodePackages; [
    pkgs.pkg-config
    pkgs.python3
    pkgs.deno
    pkgs.vips
    pkgs.biome
    nodejs
    node-gyp
    node-gyp-build
    pnpm
    typescript
    typescript-language-server
    prettier
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
    alias run='pnpm run'
    alias serve='netlify dev:exec'
    alias test='pnpm test'
    alias lint='biome lint'
    alias format='biome format'
    exec fish
  '';
}
