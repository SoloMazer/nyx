{ pkgs, ... }: {
  programs.nixvim = {
    # LaTex related plugins
    plugins.vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull;
      settings = {
        view_method = "general";
      };
    };

    # C/Cpp related plugins
    # plugins.plenary.enable = true; # Dependency for cmake-tools-nvim and other things
    extraPlugins = with pkgs.vimPlugins; [
      cmake-tools-nvim
    ];
    extraConfigLua = ''
      require("cmake-tools").setup({
        cmake_runner = {
          name = "toggleterm", -- Use 'toggleterm' as the runner
          opts = { -- Specific options for toggleterm
            direction = "float", -- Options: 'vertical', 'horizontal', 'tab', or 'float'
            close_on_exit = false, -- Keep terminal open after the process exits
            auto_scroll = true, -- Automatically scroll to the bottom of the terminal
            singleton = true, -- Ensure a single instance of toggleterm is used for CMake output
          },
          default_opts = {
            toggleterm = {
              direction = "float", -- Float mode for toggleterm
              close_on_exit = false,
              auto_scroll = true,
              singleton = true,
            },
          },
        },
      })
    '';
  };
}
