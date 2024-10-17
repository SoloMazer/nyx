{
  programs.nixvim = {

    enableMan = true;
    clipboard.register = "unnamedplus";
    globals = {
      mapleader = " ";
      have_nerd_font = true;
    };
    opts = {
      # line numbers
      relativenumber = true;
      number = true;
      # tabs & indentation
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      # line wrapping
      wrap = false;
      # search settings
      ignorecase = true;
      smartcase = true;
      # cursor line
      cursorline = true;
      # Appearance
      termguicolors = true;
      background = "dark";
      signcolumn = "yes";
      # Backspace
      backspace = "indent,eol,start";
      swapfile = true;
      # Seeting a right margin
      colorcolumn = "125";
      #split windows
      splitright = true; # Split vertical windows to the right
      splitbelow = true; # Split horizontal window to the bottom
      breakindent = true;
      undofile = true;
      scrolloff = 10;
    };

    # Performace options

    # WARN: byteCompileLua converts lua to pre-compiled byte code
    # This Improves performance at the cost of 
    # 1. Debugging Difficulty (error messages might not be clear)
    # 2. Increased Complexity (every change to config asks to recompile everything)
    # 3. Compatibility Issues (some plugins may not work as expected)
    # 4. Incompatibility with hot reloading (Dynamic reloading will not work)
    # 5. Storage Space (May take more storage space)
    performance.byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      # nvimRuntime = true;
      plugins = true;
    };

    # WARN: Whether to enable EXPERIMENTAL option to combine all plugins into a single
    # plugin pack. It can significantly reduce startup time, but all your plugins must 
    # have unique filenames and doc tags. Any collision will result in a build failure. 
    # To avoid collisions you can add your plugin to the standalonePlugins option. Only 
    # standard neovim runtime directories are linked to the combined plugin. If some of 
    # your plugins contain important files outside of standard directories, add these 
    # paths to pathsToLink option.
    performance.combinePlugins.enable = true;
    performance.combinePlugins.standalonePlugins = [
      "nvim-treesitter"
      "nord.nvim"
      "nvim-config"
      "mini.nvim"
    ];


  };
}
