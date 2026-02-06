{ lib, pkgs, ... }:
let
  excludesList = [
    ".git"
    ".direnv"
    ".cache"
    ".direnv/**"
    "pfx"
    "dosdevices"
    "*.lock"
  ];
  excludeArgs = patterns: map (p: "--exclude ${lib.escapeShellArg p}") patterns;
  excludesStr = lib.concatStringsSep " " (excludeArgs excludesList);
  fdFlags = "--hidden --color=always --strip-cwd-prefix " + excludesStr;
  fdCommand = "fd --type f " + fdFlags;
  fdDirCommand = "fd --type d " + fdFlags;
in
{
  programs = {
    fzf = {
      enable = true;
      defaultCommand = fdCommand;
      fileWidgetCommand = fdCommand;
      changeDirWidgetCommand = "zoxide query -ls | ${fdDirCommand}";
      changeDirWidgetOptions = [
        "--preview='${pkgs.eza}/bin/eza --tree --color=always {}'"
        "--preview-window=50%,border-rounded"
      ];
      historyWidgetOptions = [
        "--color=header:italic"
        "--preview-window=hidden"
        "--scheme=history"
      ];
      defaultOptions = [
        "--ansi"
        "--style=full"
        "--color=border:blue"
        "--color=prompt:green"
        "--color=info:bright-black"
        "--preview='env BAT_THEME=base16 ${pkgs.fzf-preview}/bin/fzf-preview {}'"
        "--preview-window=60%,border-rounded"
      ];
    };
    eza.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    fd = {
      enable = true;
      ignores = excludesList;
    };
  };
  home = {
    packages = [ pkgs.fzf-preview ];
    sessionVariables = {
      FZF_DEFAULT_COMMAND = fdCommand;
      FZF_CTRL_T_COMMAND = fdCommand;
      FZF_PREVIEW_COLUMNS = "80";
      FZF_PREVIEW_LINES = "24";
      _ZO_FZF_OPTS = fdFlags;
    };
  };
}
