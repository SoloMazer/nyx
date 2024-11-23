{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 5000;
      share = true;
      size = 5000;
    };
    historySubstringSearch.enable = true;
    prezto = {
      enable = true;
      prompt.theme = "pure";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      ":q" = "exit";
      c = "clear";
      ls = "ls --color";
      nh = "flatpak update && nh";
    };
  };
}
