# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, pkgs
, ...
}: let colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
 in {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    #    inputs.anyrun.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.tokyonight.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    #inputs.nix-colors-adapters.homeManagerModules.default
    ./terminal.nix
    ./hypr.nix
    ./binds.nix
    ./waybar.nix
    ./spotify.nix
  ];
  programs.home-manager.enable = true;

  tokyonight = {
    enable= true;
    style = "night";
  };
  programs.git.enable = true;
  programs.fish.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      background = "#${colorScheme.palette.base00}";
    };
  };

  qt.enable = true;

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
  home.packages = with pkgs; [
    fish
    fzf
    starship
    zoxide
    firefox-devedition
    alacritty
    obsidian
    gh
    vscode
    nixpkgs-fmt
    hyprpaper
    hypridle
    hyprlock
    playerctl
    pavucontrol
    dunst
    libsForQt5.dolphin
    kitty
    rofi-wayland
    unzip
    ocenaudio
    kdePackages.kdenlive
    frei0r
    highlight
  ];

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
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

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
      opts = {
	number = true;
  	relativenumber = true;
  	shiftwidth = 2;
      };
  	plugins.lightline.enable = true;
  	colorschemes.tokyonight.enable = true;
  };

  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    package = pkgs.rofi-wayland;
  };
services.hyprpaper = {
  enable = true;
  settings = {
    splash = false;
    preload = ["~/Pictures/Wallpapers/FallingFrontier/berwick.titan.png"];
    wallpaper = [",~/Pictures/Wallpapers/FallingFrontier/berwick.titan.png"];
  };
};

#services.hypridle = {
#  enable = true;
#  settings = {
#    general = {
#      after_sleep_cmd = "hyprctl dispatch dpms on";
#      ignore_dbus_inhibit = false;
#      lock_cmd = "hyprlock";
#    };
#    listener = [
#      {
#        timeout = 900;
#	on-timeout = "hyprlock";
#      }
#      {
#        timeout = 1200;
#	on-timeout = "hyprctl dispatch dpms off";
#	on-resume = "hyprctl dispatch dpms on";
#      }
#    ];
#  };
#};
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
