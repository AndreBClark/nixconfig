{
  pkgs ? import <nixpkgs> { },
}:
let
  pythonEnv = pkgs.python313.withPackages (ps: [
    ps.requests
  ]);
in
pkgs.mkShell {
  packages = builtins.attrValues {
    inherit (pkgs)
      pythonEnv
      black
      mypy
      libffi
      openssl
      ;
  };
}
