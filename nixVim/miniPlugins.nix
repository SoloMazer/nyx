{ pkgs, ... }:
{ 
  programs.nixvim = {
    extraPlugins = [pkgs.vimPlugins.minimap-vim];
    # Enabling the mini.nvim plugin suite
    plugins.mini = {
      enable = true;
      modules = {
        
        # Loading the mini.ai
        ai = {
          n_lines = 50;
          search_method = "cover_or_next";
        };
        
        # loading mini.comment
        comment = {
          #TODO but this mapping in keymaps.nix later
          mappings = {
            comment = "<leader>/";
            comment_line = "<leader>/";
            comment_visual = "<leader>/";
            textobject = "<leader>/";
          };
        };
        
        # loading mini.starter
        starter = {
          content_hooks = {
            "__unkeyed-1.adding_bullet" = {
              __raw = "require('mini.starter').gen_hook.adding_bullet()";
            };
            "__unkeyed-2.indexing" = {
              __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
            };
            "__unkeyed-3.padding" = {
              __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
            };
          };
          evaluate_single = true;
          header = ''
            ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
            ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
            ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
            ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
            ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
          '';
          items = {
            "__unkeyed-1.buildtin_actions" = {
              __raw = "require('mini.starter').sections.builtin_actions()";
            };
            "__unkeyed-2.recent_files_current_directory" = {
              __raw = "require('mini.starter').sections.recent_files(10, false)";
            };
            "__unkeyed-3.recent_files" = {
              __raw = "require('mini.starter').sections.recent_files(10, true)";
            };
            "__unkeyed-4.sessions" = {
              __raw = "require('mini.starter').sections.sessions(5, true)";
            };
          };
        };
        
        # loading mini.surrond
        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";
            update_n_lines = "gsn";
          };
        };

        # loading mini.animate
        animate = {};
        icons = {};
        pairs = {};
        sessions = {};

        #TODO: To be removed later
        files = {};

      };
    };
    extraConfigLua = ''
      --NOTE: Additional Config for mini.animate
      require("mini.animate").setup({
        resize = {
          timing = require("mini.animate").gen_timing.linear({ duration = 50, unit = "total" }),
        },
        scroll = {
          timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = require("mini.animate").gen_subscroll.equal({
            predicate = function(total_scroll)
              -- Detect mouse scrolling
              if vim.g.mouse_scrolled then
                vim.g.mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      })

      -- Disable animate for specific file types
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "grug-far",
        callback = function()
          vim.b.minianimate_disable = true
        end,
      })

      -- Track mouse scroll state
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          vim.g.mouse_scrolled = true
          return key
        end, { expr = true })
      end
    '';
  };
}
