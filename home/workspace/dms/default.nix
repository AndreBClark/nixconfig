{
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.danksearch.homeModules.dsearch
    inputs.dms-plugin-registry.modules.default
    ./dms.kdl.nix
    ./niri-binds.kdl.nix
    ./stylix-theme.nix
    ./sync.nix
  ];
  stylix.targets.dank-material-shell.enable = false;
  programs = {
    dank-material-shell = {
      enable = true;
      systemd.enable = true;
      enableSystemMonitoring = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      settings = builtins.fromJSON (builtins.readFile ./settings.json);
      plugins = {
        calculator.enable = true;
        mediaPlayer.enable = true;
        displayManager.enable = true;
        niriWindows.enable = true;
        powerUsagePlugin.enable = true;
        nixMonitor.enable = true;
        wallpaperDiscovery.enable = true;
      };
    };
    dsearch.enable = true;
  };
}
