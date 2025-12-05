{
  pkgs ? import <nixpkgs> { },
  nodePackages ? pkgs.nodePackages,
}:
pkgs.mkShell {
  name = "web";
  buildInputs =
    with pkgs;
    with nodePackages;
    [
      pkg-config
      python3
      nodejs
      node-gyp
      node-gyp-build
      deno
      pnpm
      vips
      typescript
      typescript-language-server
      biome # Add Biome.js for linting, formatting, and more
      prettier # Optional if you prefer Prettier alongside
    ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
    alias run='pnpm run'
    alias serve='netlify dev:exec'
    alias test='pnpm test'
    alias lint='biome lint'
    alias format='biome format'
  '';
}
