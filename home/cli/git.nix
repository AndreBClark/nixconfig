{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "AndreBClark";
        email = "andre@cosmicdivision.dev";
      };
      interactive.diffFilter = "delta --color-only";
      diff = {
        colorMoved = "default";
      };
      delta = {
        diff-so-fancy = true;
        line-numbers = true;
      };
      alias = {
        delta = "!f() { git diff \"$@\" | delta --side-by-side; }; f";
      };
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
