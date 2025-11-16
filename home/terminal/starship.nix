{ lib, ... }:
{
  programs.starship = {
    enable = true;
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
        "$cmd_duration"
        "$status"
        "$direnv"
        "$nix_shell"
        "$php"
        #         "$python"
        "$nodejs"
        "$rust"
        "$sudo"
        "$shell"
        "$git_commit"
        "$git_metrics"
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
      shell = {
        format = " with $indicator ";
        fish_indicator = "󰈺 fsh";
        disabled = false;
      };
      nix_shell = {
        disabled = false;
        format = "[$symbol(\($name\))]($style) ";
      };
      python = {
        symbol = "";
        style = "bold yellow";
        format = "[$symbol $version]($style)";
      };
      nodejs.format = "[$symbol$version]($style)";
      cmd_duration = {
        format = "took $duration ";
        disabled = false;
        min_time_to_notify = 45000;
      };
    };
  };
}
