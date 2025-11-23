{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./lsp.nix
    ./plugins.nix
    ./keymaps.nix
    ./treesitter.nix
    ./cmp.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals = {
      mapleader = " ";
    };
    extraConfigLua = ''
      local cmp_enabled = true
      vim.api.nvim_create_user_command("ToggleAutoComplete", function()
        if cmp_enabled then
          require("cmp").setup.buffer({ enabled = false })
          require("notify")("Disabled Autocomplete", "info")
          cmp_enabled = false
        else
          require("cmp").setup.buffer({ enabled = true })
          require("notify")("Enabled Autocomplete", "info")
          cmp_enabled = true
        end
      end, {})
    '';
  };
}
