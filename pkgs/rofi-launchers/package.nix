{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  rofi,
  theme ? "catppuccin",
  powermenu ? {
    type = "type-2";
    style = "style-8";
  },
  launcher ? {
    type = "type-2";
    style = "style-8";
  },
}:
stdenvNoCC.mkDerivation {
  name = "rofi-launchers";

  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "rofi";
    rev = "093c1a79f58daab358199c4246de50357e5bf462";
    hash = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
  };

  buildInputs = [ rofi ];

  postPatch = ''
    files=$(find files/scripts -type l)
    for file in $files; do
      substituteInPlace $file \
        --replace-fail '$HOME/.config/rofi' "$out/share" \
        --replace-fail "rofi " "${lib.getExe rofi} "
    done

    files=$(find files/launchers -type f -name "*.rasi" -o -name "*.sh")
    for file in $files; do
      substituteInPlace $file \
        --replace-quiet '~/.config/rofi' "$out/share" \
        --replace-quiet 'onedark.rasi' '${theme}.rasi' \
        --replace-quiet 'style-1' '${launcher.style}' \
        --replace-quiet 'center;' 'south;'
    done

    files=$(find files/powermenu -type f -name "*.rasi" -o -name "*.sh")
    for file in $files; do
      substituteInPlace $file \
        --replace-quiet '~/.config/rofi' "$out/share" \
        --replace-quiet 'onedark.rasi' '${theme}.rasi' \
        --replace-quiet 'style-1' '${powermenu.style}' \
        --replace-quiet 'feather bold 32' 'feather bold 10' \
        --replace-quiet ' west;' ' southwest;' \
        --replace-quiet 'location: center; anchor: center;' 'location:southwest; anchor: southwest;'
    done
  '';

  installPhase = ''
    runHook preInstall

    # Install all scripts as binaries
    mkdir -p $out/bin
    for script in files/scripts/*; do
      install -Dm755 $script $out/bin/$(basename $script)
    done

    # Install Fonts
    mkdir -p "$out/share/fonts"
    cp -r fonts/* "$out/share/fonts"

    # Install other necessary files
    mkdir -p "$out/share"
    cp -r files/* "$out/share"

    runHook postInstall
  '';

  meta = {
    description = "A collection of rofi launchers";
    homepage = "https://github.com/adi1090x/rofi";
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.linux;
  };
}
