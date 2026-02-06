{ pkgs }:
pkgs.mkShellNoCC {
  name = "nix";
  packages = with pkgs; [
    nh
    direnv
    nix-direnv
    devenv
    nix-prefetch
    nix-output-monitor
    jq
    nixd
    cachix
    niv
    nixfmt
    statix
    vulnix
    flake-checker
    home-manager
  ];
  shellHook = ''
    # Enable better error reporting
    export NIX_SHOW_WARN=1
    export NIX_ERROR_COLOR=auto
  '';
}
