{pkgs, ...}:{
  home.packages = [pkgs.dunst];
  services.dunst = {
  enable = true;
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    settings.global = {
#       format = "<i>%a</i>\n<b>%s</b>\n%b";
      font = "JetBrainsMono Nerd Font 12";
      width = "(240,480)";
      height = "(100,240)";
      offset = "(20,40)";
      word_wrap = true;
      corner_radius = 5;
      frame_width = 0;
      show_indicators = true;
#       enable_recursive_icon_lookup = true;
#       icon_theme = "Dracula";
      min_icon_size = 24;
      max_icon_size = 96;
      progress_bar = true;
      indicate_hidden = true;
      padding = 8;
      horizontal_padding = 8;
      notification_limit = 0;
    };
  };
}
