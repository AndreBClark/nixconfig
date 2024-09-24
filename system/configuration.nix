# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
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
    ./locale.nix
    # If you want to use modules from other flakes (such as nixos-hardware):
    ./hardware-configuration.nix
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    ({ options, lib, ... }: lib.mkIf (options ? virtualisation.memorySize) {
      users.users.andrec.password = "nixos";
    })
    inputs.home-manager.nixosModules.home-manager
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration

  ];




  nix.settings.experimental-features = ["nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];
  programs.dconf.enable = true;

  programs.steam = {
   enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

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


  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode"]; }) ];
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "seadragon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

programs.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
};
  services.desktopManager.plasma6.enable = true;
# environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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
