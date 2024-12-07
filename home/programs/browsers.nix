{pkgs, ...}: {

programs.firefox = {
  package = pkgs.firefox-devedition;
  enable = true;
};
  programs.chromium.enable =true;

  programs.vivaldi = {
    enable = true;
    package = pkgs.vivaldi;
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