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
      "filebrowser"
      "calc"
      "emoji"
      "games"
      {
        name = "obsidian";
        path = lib.getExe pkgs.rofi-obsidian;
      }
    ];
    plugins = with pkgs; [
      rofi-calc rofi-emoji rofi-games rofi-power-menu rofi-obsidian
    ];
    extraConfig = {
      show-icons = true;
      sort = true;
      sorting-method = "fzf";
      modi=["drun,window,run"];
      combi-modes = [
        "drun"
        "run"
        "filebrowser"
        "obsidian"
        "games"
      ];
    display-combi = "";
    display-drun = "Apps: ";
    display-run = "Commands: ";
    display-window = "Window: ";
    matching = "fuzzy";
    drun-match-fields = "name,generic,categories,keywords";
    drun-parse-user = true;
    drun-parse-system = false;
    drun-exclude-categories = ["Games"];
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
          padding = mkLiteral "8px";
          spacing = mkLiteral "0px";
          width = 512;
          border-size = 0;
          border-style = "none";
        };

        "window" = {
          width = 1080;
          border-radius = mkLiteral "12px";
        };
        "mainbox" = {
          padding = mkLiteral "12px";
          width = 1080;
        };

        "#inputbar" = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          border-radius = mkLiteral "16px";
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "4px";
        };
      };
  };
}
