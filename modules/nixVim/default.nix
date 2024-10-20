{ pkgs, ... }:
{
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
    performance.enable = false;
    environment.systemPackages = with pkgs; [
      #neovim dependencies
      xsel
      ripgrep
      fd
      manix
    ];
}
