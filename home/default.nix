# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, pkgs
, ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    inputs.nixvim.homeManagerModules.nixvim
    inputs.tokyonight.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    #inputs.nix-colors-adapters.homeManagerModules.default
    ./services.nix
    ./starship.nix
    ./neovim.nix
    ./hypr.nix
    ./binds.nix
    ./waybar.nix
    ./spotify.nix
  ];
  programs.home-manager.enable = true;
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
  tokyonight = {
    enable= true;
    style = "night";
  };
  programs.git.enable = true;


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
    firefox-devedition
    obsidian
    steam
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
    tokyonight-gtk-theme
    dracula-icon-theme
    adwaita-qt
    grim
    slurp
  ];

  gtk.enable = true;
  gtk.theme.name = "tokyonight-gtk";
  gtk.theme.package = pkgs.tokyonight-gtk-theme;

  qt.platformTheme.name = "gtk";
  qt.style.name ="adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  programs.firefox = {
    package = pkgs.firefox-devedition;
    profiles.andrec = {
      userChrome = ''
        #appcontent {
          background: transparent !important;
        }
      '';
      preferences = {
        toolkit.legacyUserProfileCustomizations.stylesheets = true;
        gfx.webrender.all = true;
      };
    };
  };


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
    package = pkgs.rofi-wayland;
  };
  programs.vscode.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
