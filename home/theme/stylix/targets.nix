{ ... }:
{
  stylix = {
    targets = {
      # gtk.enable = false;
      # gnome.enable = false;
      # rofi.enable = false;
      # firefox.profileNames = lib.mkIf config.programs.firefox.enable [ "dev-edition-default" ];
      # gnome-text-editor.enable = lib.mkForce false;
      nixvim.plugin = "base16-nvim";
    };
  };
}
