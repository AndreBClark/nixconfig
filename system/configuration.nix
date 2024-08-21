# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
, lib
, config
, pkgs
, ...
}: {

  nixpkgs = {
    # You can add overlays here

    # Configure your nixpkgs instance
    config = {
      boot.loader.grub.device = "nodev";
      boot.loader.systemd-boot.enable = true;

      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    ({ options, lib, ... }: lib.mkIf (options ? virtualisation.memorySize) {
      users.users.andrec.password = "nixos";
    })
    inputs.home-manager.nixosModules.home-manager
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

  ];
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    home-manager
    fish
    sddm-sugar-dark
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    xdg-desktop-portal-gtk
    steam

    catppuccin-cursors.mochaSky
  ];
  programs.dconf.enable = true;
  programs.steam.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "gtk" "hyprland" ];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };


  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "seadragon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };



  services.xserver = {
    enable = true;
    xkb.layout = "us";
    # NVIDIA drivers are unfree.
    videoDrivers = [ "nvidia" ];
  };


programs.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
};

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    # Enable modesetting for Wayland compositors (hyprland)
    modesetting.enable = true;
    # Use the open source version of the kernel module (for driver 515.43.04+)
    #   open = true;
    # Enable the Nvidia settings menu
    nvidiaSettings = true;
    # Select the appropriate driver version for your specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
#  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # This variable fixes electron apps in wayland

programs.fish.enable = true;
programs.fish.promptInit = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
'';
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users = {
    defaultUserShell = pkgs.fish;
    users = {
    # FIXME: Replace with your username
    andrec = {
      # TODO: You can set an initial password for your user.
      shell = pkgs.fish;
      isNormalUser = true;
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      #       openssh.authorizedKeys.keys = [
      #         # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      #       ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
};



  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users = {
      "andrec" = import ../home;
    };
  };
  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
