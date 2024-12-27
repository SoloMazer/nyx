{ pkgs
, inputs
, ...
}: {
  programs.nixvim.enable = true;
  # Import all your configuration modules here
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins.nix
    ./miniPlugins.nix
    ./extraPlugins.nix
    ./advPlugins.nix
    ./languagePlugins.nix
    ./performance.nix
  ];
  environment.systemPackages = with pkgs; [
    #neovim dependencies
    xsel
    ripgrep
    fd
    manix
    nixd
  ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
