{ config, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  programs = {
    kitty = {
      enable = true;
      settings = {
        tab_title_template = "[{index}] {tab.active_wd}{activity_symbol}";
        tab_title_max_length = 0;
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        tab_powerline_style = "round";
      };
      extraConfig = ''
        active_tab_background ${colors.base0C}
        active_tab_foreground ${colors.base01}

        inactive_tab_background ${colors.base0D}
        inactive_tab_foreground ${colors.base02}
      '';
    };
    tmux.terminal = "kitty";
  };

}
