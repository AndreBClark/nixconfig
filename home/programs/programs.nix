{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    nixpkgs-fmt
    nixfmt-rfc-style
    playerctl
    pavucontrol
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
    shared-mime-info
  ];
  programs = {
    direnv.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
    };
  };
}
