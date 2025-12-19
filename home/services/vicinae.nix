{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
  ];
  services.vicinae = {
    enable = true; # default: false
    autoStart = true; # default: true
    settings = {
      faviconServices = "twenty";
      popToRootOnClose = true;
      rootSearch.searchFiles = false;
      closeOnFocusLoss = true;
      font = {
        name = config.stylix.fonts.monospace;
        size = config.stylix.fonts.sizes.applications;
      };
      window = {
        csd = true;
        opacity = config.stylix.opacity.popups;
        rounding = 10;
      };
      theme.name = config.lib.stylix.colors.scheme-slug;
    };
    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      nix
      omarchy-menu
      wifi-commander
      kde-system-settings
      fuzzy-files
      player-pilot
    ];
  };

  # changes the icon for plasma quicklauncher
  xdg.desktopEntries.vicinae-url-handler = {
    icon = "nix-snowflake-white";
    type = "Application";
    name = "Vicinae Deeplink Handler";
    genericName = "Vicinae Deeplink Handler";
    comment = "Open Vicinae Deeplinks";
    exec = "vicinae %u";
    terminal = false;
    categories = [
      "System"
      "Utility"
    ];
    noDisplay = true;
    mimeType = [
      "x-scheme-handler/vicinae"
      "x-scheme-handler/raycast"
      "x-scheme-handler/com.raycast"
    ];
  };
}
