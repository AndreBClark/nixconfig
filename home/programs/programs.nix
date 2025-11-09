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
    unzip
    ocenaudio
    kdePackages.kdenlive
    frei0r
    devenv
    jq
    omnisharp-roslyn
    nil
    audacity
    ocenaudio
    nh
  ];
  programs = {
    direnv.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
    };
  };
}
