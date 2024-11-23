{pkgs, ... }:
{
  programs.nixvim = { 
    extraPlugins = [
      pkgs.vimPlugins.tabby-nvim
      (pkgs.vimUtils.buildVimPlugin {
        name = "neominimap";
        src = pkgs.fetchFromGitHub {
          owner = "Isrothy";
          repo = "neominimap.nvim";
          rev = "main";
          hash = "sha256-b+BdomwjuodDM5yBVsYuMR/lsjkAGj16KNMHDqYVuxQ=";
        };
      })
    ];

    extraConfigLua = ''

      --NOTE: Additional Config for tabby plugin
      require("tabby").setup({
        preset = "active_wins_at_tail",
        option = {
          theme = {
            fill = "TabLineFill", -- tabline background
            head = "TabLine", -- head element highlight
            current_tab = "TabLineSel", -- current tab label highlight
            tab = "TabLine", -- other tab label highlight
            win = "TabLine", -- window highlight
            tail = "TabLine", -- tail element highlight
          },
          nerdfont = true, -- whether use nerdfont
          lualine_theme = nil, -- lualine theme name
        },
      })     

      -- NOTE: Additional Config for neominimap
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36 -- Set a large value
      ---@type Neominimap.UserConfig
      vim.g.neominimap = {
        auto_enable = true,
        --- Used when `layout` is set to `float`
        float = {
          minimap_width = 17, ---@type integer
          --- Border style of the floating window.
          --- Accepts all usual border style options (e.g., "single", "double")
          --- @type string | string[] | [string, string][]
          window_border = "none",
        },
      }

    '';
  };
}
