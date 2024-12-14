{
  pkgs,
  system,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    obsidian
    discord
    vscode
    nixpkgs-fmt
    nixfmt-rfc-style
    playerctl
    pavucontrol
    dunst
    nautilus
    unzip
    ocenaudio
    kdenlive
    frei0r
    devenv
  ];
  programs.vscode.enable = true;
  programs.direnv.enable = true;
}