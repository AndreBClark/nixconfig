{
  pkgs,
 lib,
 config,
  ...
}:
{
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
      rofi-calc rofi-emoji rofi-games rofi-power-menu rofi-file-browser
    ];
    extraConfig = {
      show-icons = true;
      sort = true;
      sorting-method = "fzf";
      hide-scrollbar = true;
      combi-modes = [
        "drun"
        "run"
        "games"
      ];
    display-combi = "";
    display-drun = "App ";
    display-run = "Command ";
    display-window = "Window ";
    display-file-browser-extended = "File";
    matching = "fuzzy";
    drun-match-fields = "name,generic,categories,keywords";
    drun-parse-user = true;
    drun-parse-system = false;
    };
    terminal = "kitty";
    font = "JetBrainsMono Nerd Font 12";
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          font = "JetBrainsMono Nerd Font 12";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          spacing = mkLiteral "0px";
        };

        "window" = {
          location = "north";
          y-offset = mkLiteral "calc(50% - 176px)";
          width = 960;
          border-radius = mkLiteral "12px";
        };

        "mainbox" = {
          padding = mkLiteral "12px";
        };

        "#inputbar" = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          border-radius = mkLiteral "16px";
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "8px";
        };
        "entry" = {
          placeholder = "Search";
        };
        "message" = {
          margin = mkLiteral "12px 0 0";
          border-radius =      mkLiteral "16px";
          border = mkLiteral "0";
        };
        "textbox" = {
          padding = mkLiteral "8px 24px";
        };

        "listview" = {
          background-color = mkLiteral "transparent";
          margin = mkLiteral "12px 0 0";
          lines = mkLiteral "8";
          columns =    mkLiteral "2";
          fixed-height = false;
          border = mkLiteral "0";
        };
        "element" = {
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "8px";
          border-radius = mkLiteral "16px";
        };
        "element-icon" = {
          size = mkLiteral "2em";
          vertical-align = mkLiteral "0.5";
        };
        "element-text" = {
          text-color = mkLiteral "inherit";
        };
      };
  };
}
