{
  lib,
  pkgs,
  config,
  ...
}:
let
  excludesList = [
    "/home/${config.home.username}/.*"
    ".git"
    ".direnv"
    ".cache"
    ".pki"
    ".dotnet"
    "pfx"
    "dosdevices"
    "*.lock"
    # Dependencies and build outputs
    "node_modules"
    "target"
    "build"
    "dist"
    "out"
    "result"
    # IDE and editor files
    ".vscode"
    ".idea"
    "*.swp"
    "*.swo"
    "*~"
    # OS-specific
    ".DS_Store"
    "Thumbs.db"
    # Cache and temporary
    ".cache"
    "tmp"
    "temp"
    "*.tmp"
  ];
  excludeArgs = patterns: map (p: "--exclude ${lib.escapeShellArg p}") patterns;
  excludesStr = lib.concatStringsSep " " (excludeArgs excludesList);
  fdFlags = "--hidden --color=always --strip-cwd-prefix " + excludesStr;
  fdCommand = "fd --type f " + fdFlags;
  fdDirCommand = "fd --type d " + fdFlags;
  customPreviewScript = pkgs.writeShellScript "kitty-preview.sh" ''
    file=$1
    type=$(file --brief --dereference --mime -- "$file")

    if [[ $type =~ image/ ]]; then
      dim=''${FZF_PREVIEW_COLUMNS}x''${FZF_PREVIEW_LINES}
      kitten icat --clear --transfer-mode=stream --unicode-placeholder --stdin=no --place="$dim@0x0" "$file"
    elif [[ $type =~ =binary ]]; then
      file "$file"
    else
      env BAT_THEME=base16 ${pkgs.bat}/bin/bat --color=always "$file"
    fi
  '';
in
{
  programs = {
    fzf = {
      enable = true;
      defaultCommand = fdCommand;
      fileWidgetCommand = fdCommand;
      fileWidgetOptions = [
        "--color=border:blue"
        "--color=prompt:green"
        "--color=info:bright-black"
      ];
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
        "--preview '${customPreviewScript} {}'"
        # "--preview='env BAT_THEME=base16 ${pkgs.fzf-preview}/bin/fzf-preview {}'"
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
    packages = [
      pkgs.fzf-preview
      pkgs.file
    ];
    sessionVariables = {
      FZF_DEFAULT_COMMAND = fdCommand;
      FZF_CTRL_T_COMMAND = fdCommand;
      FZF_PREVIEW_COLUMNS = "80";
      FZF_PREVIEW_LINES = "80";
      _ZO_FZF_OPTS = fdFlags;
    };
  };
}
