{ pkgs
, inputs
, ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
        marketplace
        newReleases
      ];
#       enabledExtensions = with spicePkgs.extensions; [
#         fullAppDisplay
#         shuffle # shuffle+ (special characters are sanitized out of ext names)
#         hidePodcasts
#         trashbin
#         goToSong
#         listPlaylistsWithSong
#         skipStats
#         powerBar
#         betterGenres
#         loopyLoop
#         history
#       ];
    };
}
