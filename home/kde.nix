{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    with libsForQt5;
    with kdePackages;
    [
      adwaita-qt
      qt5ct
      qt5.qtwayland
      qtstyleplugin-kvantum
      qt6ct
      qtwayland
      plasma-browser-integration
    ];
}
