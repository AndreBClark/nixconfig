{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
      '';
    };
    kitty.shellIntegration.enableFishIntegration = true;
    starship.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
    fzf.enableFishIntegration = true;
    tmux.shell = "${pkgs.fish}/bin/fish";
  };
}
