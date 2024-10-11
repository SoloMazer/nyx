{
  programs.nixvim = {
    # UI elements
    # Colorscheme
    colorschemes.nightfox = {
      enable = true;
      flavor = "duskfox";    
    };
    plugins = {

      # for better arrangement of ui
      dressing.enable = true; 
      noice.enable = true;

      which-key.enable = true; # To find keybindings easily
      indent-blankline.enable = true;
      notify.enable = true;
      tmux-navigator.enable = true;

      lualine.enable = true;

      # to find to do in code
      todo-comments.enable = true;
      # yank manager
      yanky = {
        enable = true;
        enableTelescope = true;
      };
      gitsigns.enable = true;

      # Fuzzy finding
      web-devicons.enable = true; # is a telescope dependency
      telescope = {
        enable = true;
        highlightTheme = "duskfox";
        extensions = {
          file-browser.enable = true;
          frecency.enable = true;
          fzf-native.enable = true;
          manix.enable = true;
          ui-select.enable = true;
          undo = {
            enable = true;
          };
        };
      };
    };
  };
}
