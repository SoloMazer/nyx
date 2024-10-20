{ pkgs, config, lib, ... }:
{
  options = {
    gnomehm.enable = 
    lib.mkEnableOption "enables user specifc home-manager code for gnome";
  };

  config = lib.mkIf config.gnomehm.enable {

    gtk = {
      enable = true;
      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };
      iconTheme = {
        package = pkgs.papirus-nord;
        name = "Papirus-Dark";
      };
      cursorTheme = {
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy-cursors";
        size = 16;
      };
    };

    home.packages = with pkgs; [
      gnome-tweaks
      nautilus
      sushi
      gnome-calendar
      gnome-system-monitor
      # Some nice gnome extensions
      gnomeExtensions.pop-shell
      gnomeExtensions.blur-my-shell
      gnomeExtensions.caffeine
      gnomeExtensions.media-controls
      gnomeExtensions.user-themes
      gnomeExtensions.compiz-alike-magic-lamp-effect
      gnomeExtensions.hide-top-bar
      gnomeExtensions.hot-edge
    ];

  };
}
