{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./fzf.nix
    ./tmux.nix
    ./zoxide.nix
  ];
  home.packages = with pkgs; [
    nixpkgs-fmt
    nixfmt-rfc-style
    devenv
    jq
    nil
  ];
  programs = {
    direnv.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
    };
  };
}
