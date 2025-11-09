{ pkgs, inputs, system, ... }:

inputs.nixos-generators.nixosGenerate {
  inherit system;
  specialArgs = {
    inherit inputs;
  };
  format = "install-iso";
  modules = [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
    ./common
    ./common/nix.nix
    ./display/plasma.nix
    {
        # Fetch the GitHub repository
        system.activationScripts.fetchRepo = ''
          echo "Fetching GitHub repository..."
          git clone https://github.com/AndreBClark/nix-config.git /mnt/etc/nixos
        '';

        # Host selection or detection logic
        system.activationScripts.selectHost = ''
          echo "Available hosts:"
          echo "1. seadragon"
          echo "2. owlthulu"
          read -p "Select a host (1 or 2): " host
          case $host in
            1)
              echo "Installing seadragon configuration..."
              cp -r /mnt/etc/nixos/hosts/seadragon /mnt/etc/nixos/hosts
              ;;
            2)
              echo "Installing owlthulu configuration..."
              cp -r /mnt/etc/nixos/hosts/owlthulu /mnt/etc/nixos/hosts
              ;;
            *)
              echo "Invalid selection. Defaulting to seadragon."
              cp -r /mnt/etc/nixos/hosts/seadragon /mnt/etc/nixos/hosts
              ;;
          esac
        '';

        # Alternatively, detect the host based on hardware
        system.activationScripts.detectHost = ''
          if dmidecode | grep -q "XPS 15 9560"; then
            echo "Detected Dell XPS 15 9560. Installing owlthulu configuration..."
            cp -r /mnt/etc/nixos/hosts/owlthulu /mnt/etc/nixos/hosts
          else
            echo "Defaulting to seadragon configuration..."
            cp -r /mnt/etc/nixos/hosts/seadragon /mnt/etc/nixos/hosts
          fi
        '';

        # Apply the configuration
        system.activationScripts.applyRepo = ''
          echo "Applying configuration from GitHub repository..."
          nixos-rebuild switch --flake /mnt/etc/nixos
        '';
      }
  ];
}