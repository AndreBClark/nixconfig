{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = config.terminal;
    shell = config.shellPath;
    tmuxinator.enable = true;
    customPaneNavigationAndResize = true;
    plugins = builtins.attrValues {
      inherit (pkgs.tmuxPlugins)
        vim-tmux-navigator
        sensible
        ;
    };
  };
}
