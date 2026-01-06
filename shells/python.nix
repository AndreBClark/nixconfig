{
  pkgs ? import <nixpkgs> { },
}:
let
  pythonEnv = pkgs.python313.withPackages (ps: [
    ps.requests
  ]);
in
pkgs.mkShell {
  packages = with pkgs; [
    pythonEnv

    black
    mypy

    libffi
    openssl
  ];
  shellHook = ''
    exec ${pkgs.fish}/bin/fish
  '';
}
