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
      jq
      nixd
      nixfmt
      statix
      vulnix
      flake-checker
      home-manager
      npins
      ;
  };
  shellHook = ''
    export NIXPKGS_ALLOW_UNFREE=1
    export NIX_SHOW_WARN=1
    export NIX_ERROR_COLOR=auto
  '';
}
