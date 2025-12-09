{ pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./tmux.nix
    ./zoxide.nix
    ./nvim
  ];
  home.packages = with pkgs; [
    nixpkgs-fmt
    nixfmt-rfc-style
    devenv
    jq
    nil
    nix-direnv
  ];
  programs = {
    direnv.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/andrec/nixconfig/"; # sets NH_OS_FLAKE variable for you
    };
  };
}
