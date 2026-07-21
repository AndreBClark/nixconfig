{
  lib,
  config,
  ...
}:
{
  palettes.base16 = with config.lib.stylix.colors.withHashtag; {
    base0a = base0A;
    base0b = base0B;
    base0c = base0C;
    base0d = base0D;
    base0e = base0E;
    base0f = base0F;
  };
  add_newline = false;
  format = lib.concatStrings [
    "$os"
    "$directory"
    "$git_branch"
    "$git_status"
    "$status"
    "$character"
  ];
  right_format = lib.concatStrings [
    "$cmd_duration"
    "$nix_shell"
    "$php"
    "$nodejs"
    "$rust"
    "$sudo"
    "$shell"
    "$git_commit"
    "$git_metrics"
  ];

  os = {
    disabled = false;
    style = "bg:base01 fg:base15";
    format = lib.concatStrings [
      "[ $symbol]($style)"
      "[ ](fg:base01 bg:base15)"
    ];
  };

  directory = {
    style = "bold base01 bg:prev_bg";
    format = lib.concatStrings [
      "[$path ]($style)"
      "[ ](fg:prev_bg bg:base01)"
    ];
    repo_root_style = "bold base10 bg:prev_bg";
    repo_root_format = lib.concatStrings [
      "[ $repo_root]($repo_root_style)[$path]($style)"
      "[ ](fg:prev_bg bg:base02)"
    ];
    substitutions = {
      "GitHub" = " ";
      "repos" = " ";
      "Downloads" = " ";
      "Pictures" = " ";
    };
  };
  git_branch = {
    style = "base06 bg:prev_bg";
    format = lib.concatStrings [
      "[$symbol$branch ]($style)"
    ];
  };
  git_status = {
    style = "fg:prev_fg bg:prev_bg";
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
      "[  ](fg:prev_bg bg:green)"
    ];
    error_symbol = lib.concatStrings [
      "[](bg:base0f)"
    ];
  };
  status = {
    disabled = false;
    format = lib.concatStrings [
      "[]($style fg:prev_bg)"
      "[ $common_meaning$signal_name$maybe_int]($style)"
    ];
    failure_style = "prev_fg bg:base0f";
    success_style = "prev_fg bg:green";
  };

  # right side
  git_commit.disabled = false;
  git_metrics = {
    disabled = false;
    format = " ([+$added]($added_style) )([-$deleted]($deleted_style) )";
  };
  shell = {
    format = " with $indicator ";
    fish_indicator = "󰈺 fish";
    disabled = false;
  };
  nix_shell = {
    disabled = false;
    symbol = "❄️";
    format = "[ $symbol$name ]($style)";
  };
  python = {
    symbol = "";
    style = "bold yellow";
    format = "[$symbol $version]($style)";
  };
  nodejs.format = "[$symbol$version]($style)";
  cmd_duration = {
    format = "for $duration";
    disabled = false;
    min_time_to_notify = 45000;
  };
  custom.palette_test = {
    when = true;
    format = "[00](fg:white bg:base00)[01](fg:white bg:base01)[02](fg:white bg:base02)[03](fg:white bg:base03)[04](fg:white bg:base04)[05](fg:white bg:base05)[06](fg:white bg:base06)[07](fg:white bg:base07)[08](fg:white bg:base08)[09](fg:white bg:base09)[0a](fg:white bg:base0a)[0b](fg:white bg:base0b)[0c](fg:white bg:base0c)[0d](fg:white bg:base0d)[0e](fg:white bg:base0e)[0f](fg:white bg:base0f)[10](fg:white bg:base10)[11](fg:white bg:base11)[12](fg:white bg:base12)[13](fg:white bg:base13)[14](fg:white bg:base14)[15](fg:white bg:base15)[16](fg:white bg:base16)[17](fg:white bg:base17)[black](fg:white bg:black)[blue](fg:white bg:blue)\n[bright-black](fg:white bg:bright-black)\n[bright-blue](fg:white bg:bright-blue)\n[bright-cyan](fg:white bg:bright-cyan)\n[bright-green](fg:white bg:bright-green)\n[bright-magenta](fg:white bg:bright-magenta)\n[bright-purple](fg:white bg:bright-purple)\n[bright-red](fg:white bg:bright-red)\n[bright-white](fg:black bg:bright-white)\n[bright-yellow](fg:white bg:bright-yellow)\n[brown](fg:white bg:brown)\n[cyan](fg:white bg:cyan)\n[green](fg:white bg:green)\n[magenta](fg:white bg:magenta)\n[orange](fg:white bg:orange)\n[purple](fg:white bg:purple)\n[red](fg:white bg:red)\n[white](fg:black bg:white)\n[yellow](fg:white bg:yellow) ";
  };
}
