{
  lib,
  config,
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
    settings = {
      font_family = "JetBrainsMonoNerdFont-Regular";
      bold_font = "JetBrainsMonoNerdFont-Bold";
      bold_italic_font = "JetBrainsMonoNerdFont-BoldItalic";
      italic_font = "JetBrainsMonoNerdFont-Italic";
      background = "#${config.colorScheme.palette.base03}";
      font = "JetBrainsMono Nerd Font";
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
      colors = {
        primary.background = "#${config.colorscheme.palette.base03}";
      };
      font.normal.family = "JetBrainsMono Nerd Font";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = with config.colorScheme.palette; {

      add_newline = false;
      format = lib.concatStrings [
        "$os"
        "[ ](fg:#${base01} bg:#${base0C})"
        "$directory"
        "[ ](fg:#${base0C} bg:#${base02})"
        "$git_branch"
        "$git_status"
        "[ ](fg:#${base02} bg:#${base03})"
        "$nodejs"
        "[ ](fg:#${base03})"
        "$rust"
        "$golang"
        "$php"
      ];

      os = {
        disabled = false;
        style = "bg:#${base01} fg:#${base0C}";
        format = "[ $symbol]($style)";
      };

      directory = {
        style = "fg:#${base02} bg:#${base0C}";
        format = "[$path ]($style)";
        #      before_repo_root_style = "fg:#${base03} bg:#${base0C}";
        repo_root_style = "fg:#${base02} bg:#${base0C}";
        repo_root_format = "[ $repo_root]($repo_root_style)[$path]($style)";
        substitutions = {
          "GitHub" = " ";
          "repos" = " ";
          "Downloads" = " ";
          "Pictures" = " ";
        };
      };

      git_branch = {
        symbol = "";
        style = "fg:#${base0C} bg:#${base02}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:#${base0C} bg:#${base02}";
        format = "[($all_status$ahead_behind )]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:${base03}";
        format = "[[ $symbol ($version) ](fg:#${base08} bg:#${base03})]($style)";
      };

      character = {
        error_symbol = "[](bold #${base0F})";
        success_symbol = "[](bold #${base0B})";
      };
    };
  };
}
