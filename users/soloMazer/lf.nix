{ pkgs
, config
, ...
}: {
  programs.lf = {
    enable = true;
    commands = { };
    keybindings = { };
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
  };
}
