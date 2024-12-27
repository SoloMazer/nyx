{
  programs.nixvim = {
    colorschemes.nord.enable = true;

    plugins = {
      dressing.enable = true; # for better ui plugin
      noice.enable = true; # expermental cool ui plugin
      indent-blankline.enable = true; # indent line support
      notify.enable = true; # for cute notifications
      which-key.enable = true; # To find keybindings easily
      tmux-navigator.enable = true; # To navigate in tmux
      todo-comments.enable = true; # Make and Manage TODOs
      gitsigns.enable = true; # Git info in visual form
      trouble.enable = true; # Better display menu for diagnostics and errors
      lualine = {
        # Status line
        enable = true;
        settings.options.theme = "nord";
      };
      yanky = {
        # yank manager
        enable = true;
        enableTelescope = true;
      };
      toggleterm = {
        enable = true; # better terminal management
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
            height = 30;
            width = 130;
          };
        };
      };
      web-devicons.enable = true;
      telescope = {
        #fuzzy finder
        enable = true;
        highlightTheme = "nord";
        extensions = {
          file-browser.enable = true;
          frecency.enable = true;
          fzf-native.enable = true;
          manix.enable = true;
          ui-select.enable = true;
          undo.enable = true;
        };
      };
    };
  };
}
