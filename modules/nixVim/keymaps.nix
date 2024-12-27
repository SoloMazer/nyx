{
  programs.nixvim = {
    # General Keymaps
    keymaps = [
      # Window Splits actions
      {
        options.desc = "[S]plit Window [V]ertically";
        key = "<leader>sv";
        action = "<C-w>v";
        mode = "n";
      }
      {
        options.desc = "[S]plit Window [H]orizontally";
        key = "<leader>sh";
        action = "<C-w>s";
        mode = "n";
      }
      {
        options.desc = "Make [S]plits [E]qual sized";
        key = "<leader>se";
        action = "<C-w>=";
        mode = "n";
      }

      # Disable arrow keys in normal mode
      {
        key = "<left>";
        action = "";
        mode = "n";
      }
      {
        key = "<right>";
        action = "";
        mode = "n";
      }
      {
        key = "<up>";
        action = "";
        mode = "n";
      }
      {
        key = "<down>";
        action = "";
        mode = "n";
      }

      # NOTE: Keymaps for Neominimap.nvim
      # Global Minimap Controls
      {
        options.desc = "Toggle global minimap";
        key = "<leader>nm";
        action = "<cmd>Neominimap toggle<cr>";
        mode = "n";
      }
      {
        options.desc = "Refresh global minimap";
        key = "<leader>nr";
        action = "<cmd>Neominimap refresh<cr>";
        mode = "n";
      }
      {
        options.desc = "Enable global minimap";
        key = "<leader>no";
        action = "<cmd>Neominimap on<cr>";
        mode = "n";
      }
      {
        options.desc = "Disable global minimap";
        key = "<leader>nc";
        action = "<cmd>Neominimap off<cr>";
        mode = "n";
      }
      #Window-Specific Minimap Controls
      {
        options.desc = "Toggle minimap for current window";
        key = "<leader>nwt";
        action = "<cmd>Neominimap winToggle<cr>";
        mode = "n";
      }
      {
        options.desc = "Refresh minimap for current window";
        key = "<leader>nwr";
        action = "<cmd>Neominimap winRefresh<cr>";
        mode = "n";
      }
      {
        options.desc = "Enable minimap for current window";
        key = "<leader>nwo";
        action = "<cmd>Neominimap winOn<cr>";
        mode = "n";
      }
      {
        options.desc = "Diable minimap for current window";
        key = "<leader>nwc";
        action = "<cmd>Neominimap winOff<cr>";
        mode = "n";
      }
      # Tab-Specific Minimap Controls
      {
        options.desc = "Toggle minimap for current tab";
        key = "<leader>ntt";
        action = "<cmd>Neominimap tabToggle<cr>";
        mode = "n";
      }
      {
        options.desc = "Refresh minimap for current tab";
        key = "<leader>ntr";
        action = "<cmd>Neominimap tabRefresh<cr>";
        mode = "n";
      }
      {
        options.desc = "Enable minimap for current tab";
        key = "<leader>nto";
        action = "<cmd>Neominimap tabOn<cr>";
        mode = "n";
      }
      {
        options.desc = "Diable minimap for current tab";
        key = "<leader>ntc";
        action = "<cmd>Neominimap tabOff<cr>";
        mode = "n";
      }
      #Buffer-Specific Minimap Controls
      {
        options.desc = "Toggle minimap for current buffer";
        key = "<leader>nbt";
        action = "<cmd>neominimap bufToggle<cr>";
        mode = "n";
      }
      {
        options.desc = "Refresh minimap for current buffer";
        key = "<leader>nbr";
        action = "<cmd>neominimap bufRefresh<cr>";
        mode = "n";
      }
      {
        options.desc = "Enable minimap for current buffer";
        key = "<leader>nbo";
        action = "<cmd>neominimap bufOn<cr>";
        mode = "n";
      }
      {
        options.desc = "Diable minimap for current buffer";
        key = "<leader>nbc";
        action = "<cmd>neominimap bufOff<cr>";
        mode = "n";
      }
      #Focus Controls
      {
        options.desc = "Focus on minimap";
        key = "<leader>nf";
        action = "<cmd>neominimap focus<cr>";
        mode = "n";
      }
      {
        options.desc = "Unfocus minimap";
        key = "<leader>nu";
        action = "<cmd>neominimap unfocus<cr>";
        mode = "n";
      }
      {
        options.desc = "Switch focus on minimap";
        key = "<leader>ns";
        action = "<cmd>neominimap toggleFocus<cr>";
        mode = "n";
      }
      #Clear search highlights
      {
        options.desc = "Clear search highlights";
        key = "<leader>nh";
        action = "<cmd>nohl<CR>";
        mode = "n";
      }

      # NOTE: Keymaps for Tabby.nvim
      {
        options.desc = "Open new tab";
        key = "<leader>ta";
        action = "<cmd>$tabnew<CR>";
        mode = "n";
      }
      {
        options.desc = "Close current tab";
        key = "<leader>tc";
        action = "<cmd>tabclose<CR>";
        mode = "n";
      }
      {
        options.desc = "Move to next tab";
        key = "<leader>tn";
        action = "<cmd>tabn<CR>";
        mode = "n";
      }
      {
        options.desc = "Move to previous tab";
        key = "<leader>tp";
        action = "<cmd>tabp<CR>";
        mode = "n";
      }
      {
        options.desc = "Move tab forward";
        key = "<leader>tmn";
        action = "<cmd>+tabmove<CR>";
        mode = "n";
      }
      {
        options.desc = "Move tab behind";
        key = "<leader>tmp";
        action = "<cmd>-tabmove<CR>";
        mode = "n";
      }

      # NOTE: Additional keymaps for Telescope
      {
        options.desc = "[F]ind [T]odos";
        key = "<leader>ft";
        action = "<cmd>TodoTelescope<CR>";
        mode = "n";
      }
      {
        options.desc = "[F]ind [U]ndo";
        key = "<leader>fu";
        action = "<cmd>Telescope undo<CR>";
        mode = "n";
      }
      {
        options.desc = "[F]ind with [M]anix";
        key = "<leader>fm";
        action = "<cmd>Telescope manix<CR>";
        mode = "n";
      }
      {
        options.desc = "[F]ile [B]rowser";
        key = "<leader>fb";
        action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>";
        mode = "n";
      }

      # NOTE: For a better looking which-key
      {
        options.desc = "[F]uzzily search";
        key = "<leader>f";
        action = "";
        mode = "n";
      }
      {
        options.desc = "[S]plit actions";
        key = "<leader>s";
        action = "";
        mode = "n";
      }
      {
        options.desc = "[N]eominimap actions";
        key = "<leader>n";
        action = "";
        mode = "n";
      }
      {
        options.desc = "Window-Specific actions";
        key = "<leader>nw";
        action = "";
        mode = "n";
      }
      {
        options.desc = "Tab-Specific actions";
        key = "<leader>nt";
        action = "";
        mode = "n";
      }
      {
        options.desc = "Buffer-Specific actions";
        key = "<leader>nb";
        action = "";
        mode = "n";
      }
      {
        options.desc = "[T]abby actions";
        key = "<leader>t";
        action = "";
        mode = "n";
      }
      {
        options.desc = "Move through tabs";
        key = "<leader>tm";
        action = "";
        mode = "n";
      }
      {
        options.desc = "[C]ode actions";
        key = "<leader>c";
        action = "";
        mode = "n";
      }
      {
        options.desc = "Cmake actions";
        key = "<leader>cm";
        action = "";
        mode = "n";
      }

      # NOTE: Keymaps for cmake-tools.nvim
      {
        options.desc = "CMake Generate";
        key = "<leader>cmg";
        action = "<cmd>CMakeGenerate<CR>";
        mode = "n";
      }
      {
        options.desc = "CMake Build";
        key = "<leader>cmb";
        action = "<cmd>CMakeBuild<CR>";
        mode = "n";
      }
      {
        options.desc = "Cmake Run";
        key = "<leader>cmr";
        action = "<cmd>CMakeRun<CR>";
        mode = "n";
      }
    ];

    # Keymaps for vim-tmux-navigator
    plugins.tmux-navigator.keymaps = [
      {
        action = "left";
        key = "<C-w>h";
      }
      {
        action = "down";
        key = "<C-w>j";
      }
      {
        action = "up";
        key = "<C-w>k";
      }
      {
        action = "right";
        key = "<C-w>l";
      }
      {
        action = "previous";
        key = "<C-w>\\";
      }
    ];

    # Telescope Keymaps
    plugins.telescope = {
      # General plugin keymaps
      keymaps = {
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "[F]ind [H]elp";
        };
        "<leader>fk" = {
          action = "keymaps";
          options.desc = "[F]ind [K]eymaps";
        };
        "<leader>ff" = {
          action = "find_files";
          options.desc = "[F]ind [F]iles";
        };
        "<leader>ft" = {
          action = "builtin";
          options.desc = "[F]ind Telescope [T]ools ";
        };
        "<leader>fw" = {
          action = "grep_string";
          options.desc = "[F]ind current [W]ord";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "[F]ind by [G]rep";
        };
        "<leader>fd" = {
          action = "diagnostics";
          options.desc = "[F]ind [D]iagnostics";
        };
        "<leader>fr" = {
          action = "resume";
          options.desc = "[F]ind [R]esume";
        };
        "<leader>f." = {
          action = "oldfiles";
          options.desc = "[F]ind Recent files";
        };
        "<leader><leader>" = {
          action = "buffers";
          options.desc = "[ ] Find existing buffers";
        };
      };

      extensions.file-browser.settings.mappings.n = {
        "c" = "require('telescope._extensions.file_browser.actions').create";
        "r" = "require('telescope._extensions.file_browser.actions').rename";
        "m" = "require('telescope._extensions.file_browser.actions').move";
        "y" = "require('telescope._extensions.file_browser.actions').copy";
        "d" = "require('telescope._extensions.file_browser.actions').remove";
        "o" = "require('telescope._extensions.file_browser.actions').open";
        "g" = "require('telescope._extensions.file_browser.actions').goto_parent_dir";
        "e" = "require('telescope._extensions.file_browser.actions').goto_home_dir";
        "w" = "require('telescope._extensions.file_browser.actions').goto_cwd";
        "t" = "require('telescope._extensions.file_browser.actions').change_cwd";
        "f" = "require('telescope._extensions.file_browser.actions').toggle_browser";
        "h" = "require('telescope._extensions.file_browser.actions').toggle_hidden";
        "s" = "require('telescope._extensions.file_browser.actions').toggle_all";
      };

      extensions.undo.settings = {
        entry_format = "state #$ID";
        mappings = {
          i = {
            "<c-cr>" = "require('telescope-undo.actions').restore";
            "<cr>" = "require('telescope-undo.actions').yank_additions";
            "<s-cr>" = "require('telescope-undo.actions').yank_deletions";
          };
          n = {
            u = "require('telescope-undo.actions').restore";
            y = "require('telescope-undo.actions').yank_additions";
            Y = "require('telescope-undo.actions').yank_deletions";
          };
        };
        side_by_side = true;
        time_format = "!%Y-%m-%dT%TZ";
        use_delta = true;
        vim_diff_opts = {
          ctxlen = 8;
        };
      };
    };

    plugins.mini.modules = {
      comment.mappings = {
        comment = "gc";
        comment_line = "gcc";
        comment_visual = "gc";
        textobject = "gc";
      };
      surround.mappings = {
        add = "gsa";
        delete = "gsd";
        find = "gsf";
        find_left = "gsF";
        highlight = "gsh";
        replace = "gsr";
        update_n_lines = "gsn";
      };
    };
  };
}
