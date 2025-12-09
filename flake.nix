{
  description = "Your new nix config";

  inputs = {
    # global, so they can be `.follow`ed
    system.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    hardware.url = "github:NixOS/nixos-hardware/master";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.hyprlang.follows = "hyprland/hyprlang";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      inputs.systems.follows = "hyprland/systems";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.hyprlang.follows = "hyprland/hyprlang";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      inputs.systems.follows = "hyprland/systems";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.hyprlang.follows = "hyprland/hyprlang";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      inputs.systems.follows = "hyprland/systems";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions.url = "github:vicinaehq/extensions";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      plasma-manager,
      nur,
      vicinae,
      ...
    }@inputs:
    let
      system = builtins.head (import inputs.system);
      username = "andrec";
      commonModules = [
        stylix.nixosModules.stylix
        nur.modules.nixos.default
      ];
      commonHomeModules = [
        stylix.homeModules.stylix
        plasma-manager.homeModules.plasma-manager
        vicinae.homeManagerModules.default
        home/unfree.nix
      ];
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        seadragon = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system username;
            hostName = "seadragon";
          };
          modules = commonModules ++ [
            ./hosts/seadragon
          ];
        };

        owlthulu = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
            hostName = "owlthulu";
          };
          modules = with inputs; [
            hardware.nixosModules.dell-xps-15-9560
            ./common
            ./hosts/owlthulu
            ./home
          ];
        };
      };
      devShells."${system}" = {
        default = import ./shells/web.nix {
          inherit pkgs;
          nodePackages = pkgs.nodePackages;
        };
        python = import ./shells/python.nix {
          inherit pkgs;
        };
      };
      homeConfigurations = {
        "${username}@seadragon" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs username;
          };
          modules = commonHomeModules ++ [
            ./home/seadragon.nix
          ];
        };

        "${username}@owlthulu" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs username system;
          };
          modules = commonHomeModules ++ [
            ./home/owlthulu.nix
          ];
        };
      };
    };
}
