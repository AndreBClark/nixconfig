{ pkgs }:

let
  imgLink = "https://cdn.mos.cms.futurecdn.net/2z5ZGragrUfgA47R4zLdnK.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "1nadjcyx357md29mj02cx1f62g1v1b5jhcyfxr3g5v9ji822fdix";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
