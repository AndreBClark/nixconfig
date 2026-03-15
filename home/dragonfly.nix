{
  imports = [
    ./default.nix
    ./terminal
    ./theme
    ./services
    ./cli
    ./workspace/dms
    ./workspace/gtk.nix
    ./workspace/qt.nix
    ./workspace/niri
    ./programs/programs.nix
    ./programs/spotify.nix
    ./programs/browsers.nix
    ./workspace/niri/laptop-output.kdl.nix
  ];
}
