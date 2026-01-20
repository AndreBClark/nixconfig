{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        settings = {
          defaults = {
            file_ignore_patterns = [
              "^.git/"
              "*.ico"
              "*.lock"
              "flake.lock"
              "pnpm-lock.yaml"
              "package-lock.json"
              "*.jpg"
              "*.jpeg"
              "*.png"
              "node_modules"
              ".venv"
              "result/*"
              "^__pycache__/"
              "^.mypy_cache/"
              "^target/"
              "^dist/"
              "^build/"
              "*.pyc"
              "*.pyo"
              "*.pyd"
              ".DS_Store"
              "Thumbs.db"
              "*.log"
              "*.tmp"
              "*.temp"
              "^output/"
              "^data/"
              "%.ipynb"
              "^coverage/"
              "^.coverage"
              "^htmlcov/"
              "*.egg-info/"
              ".pytest_cache/"
              ".tox/"
              "^vendor/"
              "^third_party/"
              "*.min.js"
              "*.min.css"
              "^\\.sass-cache/"
              "^.next/"
              "^.nuxt/"
              "^.vscode/"
              "^.idea/"
              "*.swp"
              "*.swo"
            ];
            layout_config = {
              prompt_position = "top";
            };
            sorting_strategy = "ascending";
          };
          pickers = {

            git_files = {
              show_untracked = true;
              recurse_submodules = false;
            };
          };
        };

        extensions = {
          project = {
            enable = true;
            settings = {
              base_dirs = [
                "~/repos"
                "~/nixconfig"
                "~/Documents"
              ];
            };
          };
          frecency.enable = true;
          fzf-native.enable = true;
          zoxide.enable = true;
          advanced-git-search.enable = true;
          live-grep-args = {
            enable = true;
          };
        };
      };
    };
    extraConfigLua = ''
      function getVisualSelection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg("v", {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ""
        end
      end
    '';
  };
}
