{ lib, ... }: {

#   gtk = {
#     enable = true;
#     iconTheme = {
#       name = "Papirus-Dark";
#       package = pkgs.catppuccin-papirus-folders.override {
#         flavor =  "mocha";
#         accent = "lavender";
#       };
#     };
#     gtk3 = {
#       extraConfig.gtk-application-prefer-dark-theme = true;
#     };
#   };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkForce "prefer-dark";
    };
  };
}
