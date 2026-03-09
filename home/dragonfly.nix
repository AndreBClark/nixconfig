{
  imports = [
    ./default.nix
    ./terminal
    ./theme
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
