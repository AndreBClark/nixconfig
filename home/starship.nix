{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    fish
    fzf
    kitty
    zoxide
    alacritty
    starship
    tmux
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
      background = "#${config.colorScheme.palette.base03}";
    };
  };
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "alacritty";
  };

  programs.zoxide.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.5;
      colors = {
	      primary.background = "#${config.colorscheme.palette.base03}";
      };
      font.normal.family = "JetBrains Mono Nerd Font";
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
"[ ](fg:#${base02} bg:#${base0E})"
"$nodejs"
"$rust"
"$golang"
"$php"
"[ ](fg:#${base0E})"
      ];

      os = {
        disabled = false;
        style =  "bg:#${base01} fg:#${base0C}";
        format = "[ $symbol]($style)";
      };

      directory = {
        style = "fg:#${base02} bg:#${base0C}";
        format = "[$path ]($style)";
      #      before_repo_root_style = "fg:#${base03} bg:#${base0C}";
        repo_root_style = "fg:#${base02} bg:#${base0C}";
        repo_root_format ="[ $repo_root]($repo_root_style)[$path]($style)";
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
