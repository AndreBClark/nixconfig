{ pkgs }:
pkgs.mkShellNoCC {
  name = "nix";
  packages = with pkgs; [
    nh
    direnv
    nix-direnv
    devenv
    nix-prefetch
    jq
    nixd
    cachix
    niv
    nixfmt
    statix
    vulnix
  ];
  shellHook = ''
    exec ${pkgs.fish}/bin/fish
  '';
}
