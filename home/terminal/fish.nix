{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      '';
    };
    man.generateCaches = false;
    kitty.shellIntegration.enableFishIntegration = true;
    starship.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
    fzf.enableFishIntegration = true;
    lazygit.enableFishIntegration = true;
    yazi.enableFishIntegration = true;
    tmux.shell = "${pkgs.fish}/bin/fish";
  };
}
