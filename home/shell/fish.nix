{ config, pkgs, ... }:
let
  mkFishPlugin = plugin: { inherit (plugin) src name; };

  mkFishPlugins = names: map (name: mkFishPlugin pkgs.fishPlugins.${name}) names;

  pluginNames = [
    "autopair"
    "done"
    "sponge"
    "grc"
    "fifc"
    "bang-bang"
    "colored-man-pages"
    "fish-you-should-use"
    "git-abbr"
  ];
in
{
  programs = {
    fish = {
      enable = true;
      plugins = mkFishPlugins pluginNames;
      interactiveShellInit = ''
        set --export fish_greeting
      '';
    };

    nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
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
    devenv.enableFishIntegration = true;
    tmux.shell = config.shellPath;
  };
  home.packages = [
    pkgs.grc
    pkgs.jq
  ];
}
