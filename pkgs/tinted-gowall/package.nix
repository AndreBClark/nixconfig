{
  stdenv,
  makeWrapper,
  fetchFromGitHub,
  writeShellApplication,
  writeShellScriptBin,
  gowall,
  jq,
  pngquant,
}:
let
  theme-resolver = writeShellScriptBin "theme-resolver" ''
    prev_arg=""
    new_args=()
    for arg in "$@"; do
      if [ "$prev_arg" = "-t" ]; then
        if echo "$arg" | grep -q '\.json$'; then
          new_args+=("$TINTED_GOWALL_THEMES/$arg")
        else
          filename=$(grep "^$arg|" "$TINTED_GOWALL_NAMES" | cut -d'|' -f2 | head -n1)
          if [ -n "$filename" ]; then
            new_args+=("$TINTED_GOWALL_THEMES/$filename")
          else
            echo "Error: Theme '$arg' not found"
            exit 1
          fi
        fi
      else
        new_args+=("$arg")
      fi
      prev_arg="$arg"
    done
    exec ${gowall}/bin/gowall "''${new_args[@]}"
  '';

  wallpaper-batch = writeShellApplication {
    name = "wallpaper-batch";
    runtimeInputs = [
      gowall
      jq
    ];
    text = builtins.readFile ./wallpaper-batch.sh;
  };

  theme-data-generator = writeShellScriptBin "theme-data-generator" ''
    themes_dir="$1"
    config_file="$2"

    echo "themes:" > "$config_file"

    for theme in "$themes_dir"/*.json; do
      name=$(jq -r '.name' "$theme")
      colors=$(jq -r '.colors[]' "$theme")

      echo "  - name: \"$name\"" >> "$config_file"
      echo "    colors:" >> "$config_file"
      for color in $colors; do
        echo "      - \"$color\"" >> "$config_file"
      done
    done
  '';

  tinted-gowall-wrapper = writeShellScriptBin "tinted-gowall" ''
    if [ "''${1:-}" = "-w" ] || [ "''${1:-}" = "--wallpaper" ]; then
      shift
      exec ${wallpaper-batch}/bin/wallpaper-batch "$@"
    else
      exec ${theme-resolver}/bin/theme-resolver "$@"
    fi
  '';
in
stdenv.mkDerivation {
  pname = "tinted-gowall";
  version = gowall.version;

  nativeBuildInputs = [
    makeWrapper
    jq
  ];

  src = fetchFromGitHub {
    owner = "tinted-theming";
    repo = "tinted-gowall";
    rev = "7670a7ba5a97b88491772fb0742ccdc2ba814c2b";
    hash = "sha256-ayTq+KlxgiWCVQaBuBKQNcB2QO0RAr+eAcf5gkg9xMU=";
  };

  buildCommand = ''
    mkdir -p $out/share/tinted-gowall/themes
    cp -r $src/themes/* $out/share/tinted-gowall/themes/
    ${theme-data-generator}/bin/theme-data-generator \
      $out/share/tinted-gowall/themes \
      $out/share/tinted-gowall/config.yml

    for theme in $out/share/tinted-gowall/themes/*.json; do
      name=$(jq -r '.name' "$theme" | sed 's/\\//g')
      filename=$(basename "$theme")
      echo "$name|$filename"
    done > $out/share/tinted-gowall/theme-names.txt

    mkdir -p $out/bin
    cp ${tinted-gowall-wrapper}/bin/tinted-gowall $out/bin/tinted-gowall

    wrapProgram $out/bin/tinted-gowall \
      --set TINTED_GOWALL_THEMES $out/share/tinted-gowall/themes \
      --set TINTED_GOWALL_NAMES $out/share/tinted-gowall/theme-names.txt

    ln -s $out/bin/tinted-gowall $out/bin/gowall

    mkdir -p $out/share/fish/vendor_completions.d


    cat > $out/share/fish/vendor_completions.d/tinted-gowall.fish <<FISH_EOF
    function __tinted_gowall_themes
      for theme in (cut -d'|' -f1 $out/share/tinted-gowall/theme-names.txt)
        echo (string escape --no-quoted $theme)
      end
    end

    complete -c tinted-gowall -f
    complete -c gowall -f

    complete -c tinted-gowall -l help -d "Show help"
    complete -c gowall -l help -d "Show help"

    complete -c tinted-gowall -x -s t -a "(__tinted_gowall_themes)" -d "Theme name"
    complete -c gowall -x -s t -a "(__tinted_gowall_themes)" -d "Theme name"

    complete -c tinted-gowall -x -s w -d "Batch wallpaper processing"
    complete -c gowall -x -s w -d "Batch wallpaper processing"

    complete -c tinted-gowall -x -n '__fish_seen_argument -s w' -a "(__tinted_gowall_themes)" -d "Theme name"
    complete -c gowall -x -n '__fish_seen_argument -s w' -a "(__tinted_gowall_themes)" -d "Theme name"
    FISH_EOF

  '';

  propagatedBuildInputs = [
    pngquant
  ];

  meta = {
    description = "gowall with tinted-theming schemes pre-included";
    inherit (gowall) meta;
  };
}
