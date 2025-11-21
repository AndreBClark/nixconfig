{ pkgs, ... }:
{
  programs = {
    firefox = {
      package = pkgs.firefox-devedition;
      enable = true;
      profiles.dev-edition-default.extensions.force = true;
    };
    vivaldi = {
      enable = true;
      package = pkgs.vivaldi;
      nativeMessagingHosts = [
        pkgs.kdePackages.plasma-browser-integration
      ];
      extensions = [
        # Bypass Paywalls Clean
        {
          id = "lkbebcjgcmobigpeffafkodonchffocl";
          updateUrl = "https://gitlab.com/magnolia1234/bypass-paywalls-chrome-clean/-/raw/master/updates.xml";
        }
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # UBlock Origin
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # Sponsor Block
        { id = "cimiefiiaegbelhefglklhhakcgmhkai"; } # Plasma Browser Integration
      ];
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
  };
}
