{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "kitty";
    shell = "${pkgs.fish}/bin/fish";
    tmuxinator.enable = true;
    customPaneNavigationAndResize = true;
    plugins = builtins.attrValues {
      inherit(pkgs.tmuxPlugins)
        vim-tmux-navigator
        sensible
      ;
    };
  };
}
