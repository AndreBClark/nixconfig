{
  config,
  lib,
  ...
}:
{
  stylix = {
    enable = true;
    targets = {
      # gtk.enable = false;
      gnome.enable = false;
      firefox.profileNames = lib.mkIf config.programs.firefox.enable [ "dev-edition-default" ];
      # gnome-text-editor.enable = lib.mkForce false;
    };
  };
}
