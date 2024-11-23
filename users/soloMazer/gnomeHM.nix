{ pkgs, config, lib, ... }:
{
    #theming desktop apps and stuff
    gtk = {
      enable = true;
      # theme = {
      #   package = pkgs.nordic;
      #   name = "Nordic";
      # };
      iconTheme = {
        package = pkgs.papirus-nord;
        name = "Papirus-Dark";
      };
      # cursorTheme = {
      #   package = pkgs.bibata-cursors;
      #   name = "Bibata-Modern-Classic";
      #   size = 16;
      # };
    };

    # # qt theming
    # qt = {
    #   enable = true;
    #   platformTheme.name = "gtk";
    #   style.name = "adwaita-dark";
    #   style.package = pkgs.adwaita-qt;
    # };

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
}
