{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-power-menu
  ];
  programs.rofi = {
    enable = true;
    modes = [
      "drun"
      "run"
      "combi"
      "keys"
      "calc"
      "emoji"
      "games"
      "file-browser-extended"
    ];
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-games
      rofi-file-browser
    ];
    extraConfig = {
      show-icons = true;
      sort = true;
      sorting-method = "fzf";
      hide-scrollbar = true;
      combi-modes = [
        "drun"
      ];
      display-file-browser-extended = "File";
      matching = "fuzzy";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      drun-parse-user = true;
      drun-parse-system = false;
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };
    terminal = "kitty";
    font = "JetBrainsMono Nerd Font 12";
  };
}
