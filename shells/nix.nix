{ pkgs }:
pkgs.mkShellNoCC {
  name = "nix";
  packages = builtins.attrValues {
    inherit (pkgs)
      nh
      direnv
      nix-direnv
      devenv
      nurl
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
      fastfetch
      npins
      ;
  };
  shellHook = ''
    export NIXPKGS_ALLOW_UNFREE=1
    export NIX_SHOW_WARN=1
    export NIX_ERROR_COLOR=auto
  '';
}
