# from https://github.com/Fymyte/dotfiles/blob/b06ddc80edad1b76bb828fd5b7977130878d11f5/pkgs/base24-schemes/package.nix
{
  lib,
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "base24-schemes";
  version = "unstable-2025-11-22";

  src = fetchFromGitHub {
    owner = "tinted-theming";
    repo = "schemes";
    rev = "1bacf7d9a61d1fe402d72303ee38d9fbc512aa35";
    hash = "sha256-hx7cwVCF7w5jkJgjQ9GKdTLRGkYb+XoZWHMpLphw6/c=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes/
    install base24/*.yaml $out/share/themes/

    runHook postInstall
  '';

  meta = with lib; {
    description = "All the 16bit and 24bit color schemes for use in base16 packages";
    homepage = finalAttrs.src.meta.homepage;
    maintainers = [ maintainers.DamienCassou ];
    license = licenses.mit;
  };
})
