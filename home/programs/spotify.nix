{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  inherit (config.lib.stylix) colors;
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];
  programs.spicetify = {
    enable = true;
    wayland = true;
    windowManagerPatch = true;
    theme = lib.mkForce spicePkgs.themes.ziro;
    colorScheme = lib.mkForce "custom";
    customColorScheme = {
      text = colors.base05;
      subtext = colors.base05;
      main = colors.base00;
      main-elevated = colors.base02;
      highlight = colors.base02;
      highlight-elevated = colors.base03;
      sidebar = colors.base01;
      player = colors.base04;
      card = colors.base03;
      shadow = colors.base00;
      selected-row = colors.base04;
      button = colors.base04;
      button-active = colors.base04;
      button-disabled = colors.base03;
      tab-active = colors.base02;
      notification = colors.base02;
      notification-error = colors.base08;
      equalizer = colors.base0B;
      misc = colors.base02;
    };
    # https://gerg-l.github.io/spicetify-nix/custom-apps.html
    enabledCustomApps = builtins.attrValues {
      inherit (spicePkgs.apps)
        newReleases
        marketplace
        lyricsPlus
        ;
    };
    # https://gerg-l.github.io/spicetify-nix/extensions.html
    enabledExtensions =
      builtins.attrValues {
        inherit (spicePkgs.extensions)
          keyboardShortcut
          fullAppDisplay
          shuffle
          hidePodcasts
          trashbin
          goToSong
          listPlaylistsWithSong
          skipStats
          songStats
          powerBar
          aiBandBlocker
          history
          playNext
          sectionMarker
          autoSkip
          playingSource
          wikify
          ;
      }
      ++ [
        {
          src = pkgs.fetchFromGitHub {
            owner = "hoeci";
            repo = "sort-play";
            rev = "eed7a38b490f718cfc9d2d7307d8da37e850f4a2";
            hash = "sha256-jrk+uWmvCVwj8Qvg9enDcYaa8yH/dOYark7UzjWnWmk=";
          };
          name = "sort-play.js";
        }
      ];
    # View all snippets: https://github.com/spicetify/marketplace/blob/main/resources/snippets.json
    enabledSnippets = [

      "Remove Popular sections from homepage"
      "Remove Unused Space in Topbar"
      "Remove top spacing"
      "Default Progress Bar"
      "Pointers"
      "Modern ScrollBar"
      "Fix 'DJ' Icon"
      "Fix 'Liked' Icon"
      "Fix 'Episodes' Icon"
      "Queue Top Side Panel"
    ];
  };
}
