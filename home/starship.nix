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

      format = lib.concatStrings [
"$os"
"[ ](fg:#${base02} bg:#${base05})"
"$directory"
"[ ](fg:#${base05} bg:#${base0E})"
"$git_branch"
"$git_status"
"[ ](fg:#${base0E} bg:#${base03})"
"$nodejs"
"$rust"
"$golang"
"$php"
"[ ](fg:#${base03})"
"$shell"
"$status"
"$username"
"$hostname"
"$localip"
      ];

      add_newline = false;

      os = {
        disabled = false;
        style =  "bg:#${base02} fg:#${base0C}";
        format = "[ $symbol]($style)";
      };

      directory = {
        style = "fg:#${base02} bg:#${base08}";
        format = "[$path ]($style)";
      #      before_repo_root_style = "fg:#${base03} bg:#${base0C}";
        repo_root_style = "fg:#${base02} bg:#${base08}";
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
        style = "fg:#${base02} bg:#${base0E}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:#${base02} bg:#${base0E}";
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
