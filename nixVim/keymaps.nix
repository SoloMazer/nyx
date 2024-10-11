{
  programs.nixvim = {

    # General Keymaps
    keymaps = [

      { options.desc = "Clear search highlights"; key = "<leader>nh"; action = "<cmd>nohl<CR>"; mode = "n";}

      # Window Splits actions
      { options.desc = "[S]plit Window [V]ertically";   key = "<leader>sv"; action = "<C-w>v"; mode = "n"; }
      { options.desc = "[S]plit Window [H]orizontally"; key = "<leader>sh"; action = "<C-w>s"; mode = "n"; }
      { options.desc = "Make [S]plits [E]qual sized";   key = "<leader>se"; action = "<C-w>="; mode = "n"; }

      # Disable arrow keys in normal mode
      { key = "<left>"; action = ""; mode = "n"; }
      { key = "<right>"; action = ""; mode = "n"; }
      { key = "<up>"; action = ""; mode = "n"; }
      { key = "<down>"; action = ""; mode = "n"; }

      # NOTE: Additional Telescope keymaps
      { options.desc = "[F]ind [T]odos";      key = "<leader>ft"; action = "<cmd>TodoTelescope<CR>";   mode = "n"; }
      { options.desc = "[F]ind [U]ndo";       key = "<leader>fu"; action = "<cmd>Telescope undo<CR>";  mode = "n"; }
      { options.desc = "[F]ind with [M]anix"; key = "<leader>fm"; action = "<cmd>Telescope manix<CR>"; mode = "n"; }
      { options.desc = "[F]ile [B]rowser";    key = "<leader>fb"; action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>"; mode = "n";}

      # For a better looking which-key
      { options.desc = "[F]uzzily search"; key = "<leader>f"; action = ""; mode = "n"; }
      { options.desc = "[S]plit actions";  key = "<leader>s"; action = ""; mode = "n"; }

    ];

    # Keymaps for vim-tmux-navigator
    plugins.tmux-navigator.keymaps = [
      { action = "left";     key = "<C-w>h";  }
      { action = "down";     key = "<C-w>j";  }
      { action = "up";       key = "<C-w>k";  }
      { action = "right";    key = "<C-w>l";  }
      { action = "previous"; key = "<C-w>\\"; }
    ];  

    # Telescope Keymaps
    plugins.telescope = {
      
      # General plugin keymaps
      keymaps = {
        "<leader>fh" = { action = "help_tags";     options.desc = "[F]ind [H]elp"; };
        "<leader>fk" = { action = "keymaps";       options.desc = "[F]ind [K]eymaps"; };
        "<leader>ff" = { action = "find_files";    options.desc = "[F]ind [F]iles"; };
        "<leader>ft" = { action = "builtin";       options.desc = "[F]ind Telescope [T]ools "; };
        "<leader>fw" = { action = "grep_string";   options.desc = "[F]ind current [W]ord"; };
        "<leader>fg" = { action = "live_grep";     options.desc = "[F]ind by [G]rep"; };
        "<leader>fd" = { action = "diagnostics";   options.desc = "[F]ind [D]iagnostics"; };
        "<leader>fr" = { action = "resume";        options.desc = "[F]ind [R]esume"; };
        "<leader>f." = { action = "oldfiles";      options.desc = "[F]ind Recent files"; };
        "<leader><leader>" = { action = "buffers"; options.desc = "[ ] Find existing buffers"; };
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

      # extensions.undo.settings = {
      #   entry_format = "state #$ID";
      #   mappings = {
      #     i = {
      #       "<c-cr>" = "require('telescope-undo.actions').restore";
      #       "<cr>" = "require('telescope-undo.actions').yank_additions";
      #       "<s-cr>" = "require('telescope-undo.actions').yank_deletions";
      #     };
      #     n = {
      #       Y = "require('telescope-undo.actions').yank_deletions";
      #       u = "require('telescope-undo.actions').restore";
      #       y = "require('telescope-undo.actions').yank_additions";
      #     };
      #   };
      #   side_by_side = true;
      #   time_format = "!%Y-%m-%dT%TZ";
      #   use_custom_command = [
      #     "bash"
      #     "-c"
      #     "echo '$DIFF' | delta"
      #   ];
      #   use_delta = true;
      #   vim_diff_opts = {
      #     ctxlen = 8;
      #   };
      # };

      

    };
  };
}           
