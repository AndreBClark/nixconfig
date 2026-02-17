{
  pkgs,
  ...
}:
let
  sources = import ../npins;
  shellInit = ''
    set --export fish_greeting
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
  '';
  shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -A";
    lt = "eza -T";
    cd = "z";
    vim = "nvim";
  };
in
{
  flake.modules.nixos.fish = {
    programs.fish = {
      enable = true;
      promptInit = shellInit;
      inherit shellAliases;
    };
    documentation.man.generateCaches = false;
  };
  flake.modules.homeManager.fish = {
    programs = {
      fish = {
        enable = true;
        plugins = [
          {
            inherit (pkgs.fishPlugins.autopair) src name;
          }
          {
            inherit (pkgs.fishPlugins.done) src name;
          }
          {
            inherit (pkgs.fishPlugins.sponge) src name;
          }
          {
            inherit (pkgs.fishPlugins.grc) src name;
          }
          {
            inherit (pkgs.fishPlugins.fifc) src name;
          }
          {
            name = "getopts";
            src = sources.getopts;
          }
          {
            name = "colored_man_pages";
            src = sources.colored_man_pages_fish;
          }
          {
            name = "fish-abbreviation-tips";
            src = sources.fish-abbreviation-tips;
          }

        ];
        interactiveShellInit = shellInit;
        inherit shellAliases;

      };
      man.generateCaches = false;
      kitty.shellIntegration.enableFishIntegration = true;
      starship.enableFishIntegration = true;
      zoxide.enableFishIntegration = true;
      fzf.enableFishIntegration = true;
      lazygit.enableFishIntegration = true;
      yazi.enableFishIntegration = true;
      eza.enableFishIntegration = true;
      direnv.enableFishIntegration = true;
      tmux.shell = "${pkgs.fish}/bin/fish";
    };
    home.packages = [
      pkgs.grc
      pkgs.jq
    ];
  };
}
