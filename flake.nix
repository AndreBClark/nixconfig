{
  inputs = {
    # global, so they can be `.follow`ed
    system.url = "github:nix-systems/x86_64-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    };

    niri.url = "github:sodiboo/niri-flake";
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
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
  };

  outputs =
    inputs@{ flake-parts, ... }:
    let
      commonModules = [
        ./variables
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
      ];
      commonHomeModules = [
        ./variables
        inputs.stylix.homeModules.stylix
        inputs.plasma-manager.homeModules.plasma-manager
        home/unfree.nix
      ];
      system = inputs.system.system or inputs.system.defaultSystem or "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      mkHost =
        hostName: modules: extraSpecialArgs:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              hostName
              ;
          }
          // extraSpecialArgs;
          modules = commonModules ++ modules;
        };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, system, ... }:
        {
          # Development shells
          devShells = {
            default = import ./shells/nix.nix {
              inherit pkgs;
            };
            web = import ./shells/web.nix { inherit pkgs; };
            python = import ./shells/python.nix { inherit pkgs; };
          };

          # Packages
          packages = {
            nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit system;
              extraSpecialArgs = {
                inherit inputs;
                lib = inputs.nixpkgs.lib.extend inputs.nixvim.lib.overlay;
              };
              module = {
                imports = [
                  ./home/cli/nvim
                ];
              };
            };
          };
        };

      flake = {
        nixosConfigurations = {
          seadragon = mkHost "seadragon" [ ./hosts/seadragon ] { };
          owlthulu = mkHost "owlthulu" [
            inputs.hardware.nixosModules.dell-xps-15-9560
            ./hosts/owlthulu
            ./home
          ] { };
        };
        # Home manager configurations
        homeConfigurations = {
          "andrec@seadragon" = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs;
            };
            modules = commonHomeModules ++ [
              ./home/seadragon.nix
            ];
          };

          "andrec@owlthulu" = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs system;
            };
            modules = commonHomeModules ++ [
              ./home/unfree.nix
              ./home/owlthulu.nix
            ];
          };
        };
      };
    };
}
