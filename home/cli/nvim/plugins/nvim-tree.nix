{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
      autoClose = true;
      openOnSetup = true;
      openOnSetupFile = true;
      ignoreFtOnSetup = [
        "startify"
        "alpha"
      ];

      settings = {
        view = {
          side = "right"; # Open on the right side
        };

        filesystem_watchers = {
          ignore_dirs = [
            "node_modules"
            ".git"
            "target"
            "dist"
          ];
        };

        git = {
          timeout = 200;
        };

        renderer = {
          highlight_git = true;
          highlight_opened_files = "all";
          highlight_modified = "all";
          group_empty = true;
          indent_markers = {
            enable = true;
          };
          icons = {
            glyphs = {
              git = {
                unstaged = "✗";
                staged = "✓";
                untracked = "★";
              };
              modified = "●";
            };
          };
        };

        filters = {
          custom = [
            "*.o"
            "*.pyc"
            "__pycache__"
          ];
        };
      };
    };

  };
}
