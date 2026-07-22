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
    : ''${XDG_CONFIG_HOME:=$HOME/.config}

    mkdir -p "$XDG_CONFIG_HOME/gowall"

    if [ -L "$XDG_CONFIG_HOME/gowall/config.yml" ]; then
      rm "$XDG_CONFIG_HOME/gowall/config.yml"
    fi

    if [ ! -e "$XDG_CONFIG_HOME/gowall/config.yml" ]; then
      ln -s @config@ "$XDG_CONFIG_HOME/gowall/config.yml"
    fi

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

    # Install wallpaper-batch binary
    ln -s ${wallpaper-batch}/bin/wallpaper-batch $out/bin/wallpaper-batch

    # Symlink gowall's completions for tinted-gowall and gowall
    mkdir -p $out/share/fish/vendor_completions.d
    ln -s ${gowall}/share/fish/vendor_completions.d/gowall.fish \
          $out/share/fish/vendor_completions.d/tinted-gowall.fish
    ln -s ${gowall}/share/fish/vendor_completions.d/gowall.fish \
          $out/share/fish/vendor_completions.d/gowall.fish

    install -Dm644 ${./wallpaper-batch.fish} $out/share/fish/vendor_completions.d/wallpaper-batch.fish
  ''
