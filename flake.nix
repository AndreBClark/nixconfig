{
  description = "Your new nix config";

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
      inputs.nixpkgs.follows = "nixpkgs";
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
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions.url = "github:vicinaehq/extensions";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      plasma-manager,
      vicinae,
      dms,
      ...
    }@inputs:
    let
      system = builtins.head (import inputs.system);
      username = "andrec";
      commonModules = [
        stylix.nixosModules.stylix
      ];
      commonHomeModules = [
        stylix.homeModules.stylix
        plasma-manager.homeModules.plasma-manager
        vicinae.homeManagerModules.default
        dms.homeModules.dankMaterialShell.default
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
            ./nixos
            ./hosts/owlthulu
            ./home
          ];
        };
      };
      devShells."${system}" = {
        default = import ./shells/nix.nix {
          inherit pkgs;
        };
        web = import ./shells/web.nix {
          inherit pkgs;
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
