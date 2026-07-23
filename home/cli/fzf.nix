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
    "tmp"
    "temp"
    "*.tmp"
  ];

  excludesStr = lib.pipe excludesList [
    (map (p: "--exclude ${lib.escapeShellArg p}"))
    (lib.concatStringsSep " ")
  ];

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
      fileWidget = {
        command = fdCommand;
      };
      changeDirWidget = {
        command = "zoxide query -ls | ${fdDirCommand} $HOME";
        options = [
          "--preview='${pkgs.eza}/bin/eza --tree --color=always {}'"
          "--preview-window=50%,border-rounded"
        ];
      };
      historyWidget = {
        options = [
          "--color=header:italic"
          "--preview-window=hidden"
          "--scheme=history"
          "--wrap"
          "--wrap-sign=$'\\t↳ '"
          "--bind=enter:accept-or-print-query"
        ];
      };
      defaultOptions = [
        "--ansi"
        "--style=full"
        "--filepath-word"
        "--cycle"
        "--scroll-off=3"
        "--color=border:blue"
        "--color=prompt:green"
        "--color=info:bright-black"
        "--tmux=center,50%,60%"
        "--ghost='Type to filter...'"
        "--preview '${customPreviewScript} {}'"
        "--preview-window='<80(hidden),80%,border-rounded'"
        "--bind=ctrl-/:toggle-wrap"
        "--bind=ctrl-p:toggle-preview"
        "--bind=ctrl-l:toggle-preview-wrap"
      ];
    };
    eza.enable = true;
    zoxide.enable = true;
    bat = {
      enable = true;
      config = {
        map-syntax = [ "*.astro:TypeScriptReact" ];
      };
    };
    fd = {
      enable = true;
      ignores = excludesList;
    };
  };
  home = {
    packages = builtins.attrValues {
      inherit (pkgs) file;
    };
    sessionVariables = {
      FZF_DEFAULT_COMMAND = fdCommand;
      FZF_CTRL_T_COMMAND = fdCommand;
      FZF_PREVIEW_COLUMNS = "80";
      FZF_PREVIEW_LINES = "80";
      _ZO_FZF_OPTS = fdFlags;
    };
  };
}
