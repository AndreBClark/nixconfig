{
  description = "Your new nix config";

  inputs = {
    # global, so they can be `.follow`ed
    systems.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hardware.url = "github:NixOS/nixos-hardware/master";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # flake-compat.url = "github:edolstra/flake-compat";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
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
    tokyonight.url = "github:mrjones2014/tokyonight.nix";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-colors-adapters.url = "gitlab:vfosnar/nix-colors-adapters";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      systems = [
        system
      ];
      username = "andrec";
      pkgs = nixpkgs.legacyPackages.${system};
  in {
      nixosConfigurations = {
        seadragon = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system username;
            hostName = "seadragon";
          };
          modules = [
            nur.modules.nixos.default
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
            ./display/plasma.nix
            ./display/hypr.nix
            ./hosts/owlthulu
            ./home
          ];
        };

      "${system}".iso = import ./isoImage.nix {
        inherit pkgs inputs system username;
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

      homeConfigurations."${username}" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit username system;
        extraSpecialArgs = {
          inherit inputs pkgs username;
        };
        modules = [
          ./home
        ];
      };
    };
}
