{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set --export fish_greeting

        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      '';
      shellAliases = {
        ls = "eza";
        ll = "eza -l";
        la = "eza -A";
        lt = "eza -T";
        cd = "z";
      };
    };

    man.generateCaches = false;
    kitty.shellIntegration.enableFishIntegration = true;
    starship.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
    fzf.enableFishIntegration = true;
    lazygit.enableFishIntegration = true;
    yazi.enableFishIntegration = true;
    eza.enableFishIntegration = true;
    direnv.enableFishIntegration = true;
    tmux.shell = "${pkgs.fish}/bin/fish";
  };
}
