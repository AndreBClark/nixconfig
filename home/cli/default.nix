{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./fzf.nix
    ./nh.nix
    ./direnv.nix
    ./tmux.nix
    ./zoxide.nix
    ./lazygit.nix
    ./yazi.nix
    ./eza.nix
    ./nvim/home.nix
  ];
  home.packages = with pkgs; [
    basalt
  ];
}
