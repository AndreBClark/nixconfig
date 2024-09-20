{pkgs, ...}: {

programs.firefox = {
  package = pkgs.firefox-devedition-unwrapped;
  enable = true;
};
  programs.chromium.enable =true;

  programs.vivaldi = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [
#     "--disable-gpu-driver-bug-workarounds"
#     "--enable-features=WaylandWindowDecorations"
#     "--enable-oop-rasterization"
#     "--enable-gpu-compositing"
     "--enable-accelerated-2d-canvas"
#      "--enable-unsafe-webgpu"
#     "--use-gl=egl"
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
#      "--use-vulkan=swiftshader"
#      "--enable-features=Vulkan"
    ];
  };

}
