{pkgs, ...}: {

programs.firefox = {
  package = pkgs.firefox-devedition;
  enable = true;
};
  programs.chromium.enable =true;

  programs.vivaldi = {
    enable = true;
    package = pkgs.vivaldi.overrideAttrs (oldAttrs: {
    buildPhase = builtins.replaceStrings
      ["for f in libGLESv2.so libqt5_shim.so ; do"]
      ["for f in libGLESv2.so libqt5_shim.so libqt6_shim.so ; do"]
      oldAttrs.buildPhase;
#    .overrideAttrs (oldAttrs: {
#    dontWrapQtApps = false;
#    dontPatchELF = true;
#    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [
#     pkgs.kdePackages.wrapQtAppsHook
#      pkgs.libsForQt5.qtwayland
#      pkgs.libsForQt5.qtx11extras
#      pkgs.kdePackages.plasma-integration.qt5
#      pkgs.kdePackages.kio-extras-kf5
#      pkgs.kdePackages.breeze.qt5
#    ];
    });
    commandLineArgs = [
#     "--disable-gpu-driver-bug-workarounds"
#     "--enable-features=WaylandWindowDecorations"
#      "--disable-features=AllowQt"
#     "--enable-oop-rasterization"
#     "--enable-gpu-compositing"
#     "--enable-accelerated-2d-canvas"
#     "--enable-unsafe-webgpu"
#     "--use-gl=egl-angle,angle=vulkan"
      "--enable-features=UseOzonePlatform"
      "--ozone-platform-hint=auto"
#      "--ozone-platform=wayland"
#      "--enable-zero-copy"
#      "--ignore-gpu-blocklist"
#     "--use-vulkan=swiftshader"
#     "--enable-features=Vulkan"
    ];
  };
}
