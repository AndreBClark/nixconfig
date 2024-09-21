# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, pkgs
, ...
}: {
  programs.git.enable = true;
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    inputs.nixvim.homeManagerModules.nixvim
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.tokyonight.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    ./theme.nix
    ./gtk.nix
    ./services.nix
    ./starship.nix
    ./neovim.nix
    ./hypr.nix
    ./binds.nix
    ./waybar.nix
    ./spotify.nix
    ./browsers.nix
  ];



  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "andrec";
    homeDirectory = "/home/andrec";
  };

  # Add stuff for your user as you see fit:
  home.packages =
    with pkgs;  [
      google-fonts
      (nerdfonts.override { fonts = ["JetBrainsMono" "FiraCode"];})
      obsidian
      discord
      gh
      vscode
      nixpkgs-fmt
      hyprpaper
      hypridle
      playerctl
      pavucontrol
      dunst
      nautilus
      adwaita-qt
      rofi-wayland
      unzip
      ocenaudio
      kdenlive
      frei0r
      highlight
      unixtools.whereis
      grim
      slurp
      nix-your-shell
      node2nix
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
#    protonup-qt
  ];
  fonts.fontconfig.enable = true;




  programs.gh.gitCredentialHelper.enable = false;
  programs.git.extraConfig.credential = {
    "https://github.com" = {
      helper = "!gh auth git-credential";
    };
    "https://gist.github.com" = {
      helper = "!gh auth git-credential";
    };
  };

  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    tokyonight.enable = false;
    package = pkgs.rofi-wayland;
    extraConfig = {
      /** Scan the current users desktop for desktop files. */
      scan-desktop = true;
      /** Parse user desktop files. */
      parse-user =   true;
      /** Parse system desktop files. */
      parse-system= false;
   };
  };
  programs.vscode.enable = true;

  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
