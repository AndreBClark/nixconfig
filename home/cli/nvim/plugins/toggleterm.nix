{
  plugins = {
    toggleterm = {
      enable = true;
      settings = {
        shell = "fish";
        size = 20;
        close_on_exit = false;
        shade_terminals = false;
        terminal_mappings = true;
        open_mapping = "[[<c-`>]]";
        zindex = 999;
      };
    };
  };
  keymaps = [
    {
      key = "<C-`>";
      action = "<cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
      mode = [
        "n"
        "t"
      ];
    }
    {
      key = "<leader>`";
      action = "<cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }
  ];
}
