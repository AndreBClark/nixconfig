{ username, system, inputs, lib, specialArgs, ... }:{
  imports = [../../common/home.nix];
    home-manager.users."${username}" = import ../../home/seadragon.nix;
}
