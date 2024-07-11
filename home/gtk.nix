{ pkgs, ... }: {
  gtk = {
    enable = true;
    font.name = "Inter V";
    iconTheme = {
      package = pkgs.dracula-theme;
      name = "Dracula-cursors";
    };
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };
}
