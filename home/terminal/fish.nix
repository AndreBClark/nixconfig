{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      plugins = [
        {
          inherit (pkgs.fishPlugins.autopair) src;
          name = "autopair";
        }
        {
          inherit (pkgs.fishPlugins.done) src;
          name = "done";
        }
        {
          inherit (pkgs.fishPlugins.sponge) src;
          name = "sponge";
        }
        {
          inherit (pkgs.fishPlugins.grc) src;
          name = "grc";
        }
        {
          inherit (pkgs.fishPlugins.fifc) src;
          name = "fifc";
        }
        {
          name = "getopts";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "getopts.fish";
            rev = "4b74206725c3e11d739675dc2bb84c77d893e901";
            sha256 = "1z5jvqip1hx59cggj9fyzaqqpz5rrsdjb3kv6ha042pbd034a57n";
          };
        }
        {
          name = "colored_man_pages";
          src = pkgs.fetchFromGitHub {
            owner = "PatrickF1";
            repo = "colored_man_pages.fish";
            rev = "f885c2507128b70d6c41b043070a8f399988bc7a";
            sha256 = "0ifqdbaw09hd1ai0ykhxl8735fcsm0x2fwfzsk7my2z52ds60bwa";
          };
        }
        {
          name = "fish-abbreviation-tips";
          src = pkgs.fetchFromGitHub {
            owner = "Gazorby";
            repo = "fish-abbreviation-tips";
            rev = "8ed76a62bb044ba4ad8e3e6832640178880df485";
            sha256 = "05b5qp7yly7mwsqykjlb79gl24bs6mbqzaj5b3xfn3v2b7apqnqp";
          };
        }
      ];
      interactiveShellInit = ''
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
}
