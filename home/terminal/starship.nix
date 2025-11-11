{
  lib,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    fzf
    zoxide
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
    '';
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
      size = 12;
    };
    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = ''family="JetBrainsMono Nerd Font Mono" style=Bold'';
      bold_italic_font = ''family="JetBrainsMono Nerd Font Mono" style="Bold Italic"'';
      italic_font = "auto";
      symbol_map = "U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ed00-U+efc1,U+f000-U+f2ff,U+f000-U+f2e0,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono";
    };
  };
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "kitty";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.5;
        blur = true;
      };
      font.normal.family = "JetBrainsMono Nerd Font";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$os"
        "$directory"
        "$git_branch"
        "$git_status"
        "$character"

      ];
      right_format = lib.concatStrings [
        "$git_commit"
        "$git_metrics"
        "$cmd_duration"
        "$nix_shell"
        "$php"
        #         "$python"
        "$nodejs"
        "$rust"
        "$sudo"
        "$shell"
      ];

      os = {
        disabled = false;
        style = "bg:crust fg:sky";
        format = lib.concatStrings [
          "[ $symbol]($style)"
          "[ ](fg:crust bg:sky)"
        ];
      };

      directory = {
        style = "bold crust bg:prev_bg";
        format = lib.concatStrings [
          "[$path ]($style)"
          "[ ](fg:prev_bg bg:base)"
        ];
        repo_root_style = "bold crust bg:prev_bg";
        repo_root_format = lib.concatStrings [
          "[ $repo_root]($repo_root_style)[$path]($style)"
          "[ ](fg:prev_bg bg:base)"
        ];
        substitutions = {
          "GitHub" = " ";
          "repos" = " ";
          "Downloads" = " ";
          "Pictures" = " ";
        };
      };
      git_branch = {
        style = "bg:prev_bg";
        format = lib.concatStrings [
          "[$symbol$branch ]($style)"
        ];
      };
      git_status = {
        style = "bg:prev_bg";
        format = lib.concatStrings [
          "[$all_status$ahead_behind]($style)"
        ];
      };
      character = {
        disabled = false;
        format = lib.concatStrings [
          "$symbol"
          "[ ](fg:prev_bg bg:none)"
        ];
        success_symbol = lib.concatStrings [
          "[ ](fg:prev_bg bg:green)"
        ];
        error_symbol = lib.concatStrings [
          "[ ](fg:prev_bg bg:red)"
        ];
      };
      #     right side
      git_commit.disabled = false;
      git_metrics.disabled = false;
      shell.disabled = false;
      nix_shell.disabled = false;
      python = {
        symbol = "";
        style = "bold yellow";
        format = "[$symbol $version]($style)";
      };
      nodejs.format = "[$symbol$version]($style)";
      cmd_duration = {
        format = "done in $duration";
        disabled = false;
        show_notifications = true;
        min_time_to_notify = 45000;
      };
    };
  };
}
