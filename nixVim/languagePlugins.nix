{ pkgs, ... }:
{
  programs.nixvim = {

    # C/Cpp related plugins
    # plugins.plenary.enable = true; # Dependency for cmake-tools-nvim and other things
    extraPlugins = with pkgs.vimPlugins; [
      cmake-tools-nvim
    ];

    # LaTex related plugins
    plugins.vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull;
      settings = {
        view_method = "general";
      };
    };

    extraConfigLua = ''
      require("cmake-tools").setup({}) 
    '';

  };   
}
