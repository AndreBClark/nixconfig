{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "AndreBClark";
        email = "andre@cosmicdivision.dev";
      };
      # credential = {
      #   "https:github.com" = {
      #     helper = "!gh auth git-credential";
      #   };
      #   "https://gist.github.com" = {
      #     helper = "!gh auth git-credential";
      #   };
      # };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
      advice = {
        addIgnoredFile = false;
      };
      init.defaultBranch = "main";
      stash.showIncludeUntracked = true;
      status = {
        short = true;
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
