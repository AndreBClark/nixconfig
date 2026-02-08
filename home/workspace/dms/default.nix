{
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.danksearch.homeModules.dsearch
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
    };
    dsearch = {
      enable = true;
    };
  };
}
