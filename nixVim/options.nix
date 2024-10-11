{
  programs.nixvim = {
    enableMan = true;
    clipboard.register = "unnamedplus";
    globals = {
      mapleader = " ";
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
      # Seeting a right margin
      colorcolumn = "125";
      #split windows
      splitright = true; # Split vertical windows to the right
      splitbelow = true; # Split horizontal window to the bottom
    };
  };
}
