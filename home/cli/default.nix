{ pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./nh.nix
    ./direnv.nix
    ./tmux.nix
    ./zoxide.nix
    ./lazygit.nix
    ./yazi.nix
    ./eza.nix
    ./nvim
  ];
  home.packages = with pkgs; [
    basalt
  ];
}
