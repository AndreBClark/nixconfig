{
  runCommand,
  makeWrapper,
  writeShellApplication,
  writeShellScriptBin,
  python3,
  gowall,
  jq,
  base16-schemes,
  yq,
}:
let
  wallpaper-batch = writeShellApplication {
    name = "wallpaper-batch";
    runtimeInputs = [
      gowall
      jq
    ];
    text = builtins.readFile ./wallpaper-batch.sh;
  };

  tinted-gowall = writeShellScriptBin "tinted-gowall" ''
    # Set up XDG directories (always runs first)
    : ''${XDG_CONFIG_HOME:=$HOME/.config}
    : ''${XDG_DATA_HOME:=$HOME/.local/share}

    # Ensure config directory exists
    mkdir -p "$XDG_CONFIG_HOME/gowall"

    # Remove broken symlink if it exists
    if [ -L "$XDG_CONFIG_HOME/gowall/config.yml" ]; then
      rm "$XDG_CONFIG_HOME/gowall/config.yml"
    fi

    # Symlink config if it doesn't exist
    if [ ! -e "$XDG_CONFIG_HOME/gowall/config.yml" ]; then
      ln -s @config@ "$XDG_CONFIG_HOME/gowall/config.yml"
    fi

    # Route to appropriate functionality
    if [ "''${1:-}" = "-w" ] || [ "''${1:-}" = "--wallpaper" ]; then
      shift
      exec ${wallpaper-batch}/bin/wallpaper-batch "$@"
    else
      exec @gowall@ "$@"
    fi
  '';
in
runCommand "tinted-gowall"
  {
    inherit (gowall) version;
    nativeBuildInputs = [
      makeWrapper
      (python3.withPackages (ps: [ ps.pyyaml ]))
      yq
    ];
    passthru = { inherit (gowall) meta; };
  }
  ''
    mkdir -p $out/bin $out/share/gowall

    python3 ${./convert-base16.py} ${base16-schemes}/share/themes $out/share/gowall/config.yml

    substitute ${tinted-gowall}/bin/tinted-gowall $out/bin/tinted-gowall \
      --subst-var-by config $out/share/gowall/config.yml \
      --subst-var-by gowall ${gowall}/bin/gowall
    chmod +x $out/bin/tinted-gowall

    ln -s $out/bin/tinted-gowall $out/bin/gowall

    # Symlink gowall's completions for both commands
    mkdir -p $out/share/fish/vendor_completions.d
    ln -s ${gowall}/share/fish/vendor_completions.d/gowall.fish \
          $out/share/fish/vendor_completions.d/tinted-gowall.fish
    ln -s ${gowall}/share/fish/vendor_completions.d/gowall.fish \
          $out/share/fish/vendor_completions.d/gowall.fish
  ''
