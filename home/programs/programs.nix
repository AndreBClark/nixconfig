{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    obsidian
    discord
    nixpkgs-fmt
    nixfmt-rfc-style
    playerctl
    pavucontrol
    dunst
    nautilus
    unzip
    ocenaudio
    kdePackages.kdenlive
    frei0r
    devenv
    jq
  ];
  programs.vscode.enable = true;
  programs.direnv.enable = true;
}
