{ pkgs, ... }:

{
      # Enable the GNOME Desktop Environment.
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      services.gnome.core-utilities.enable = false;
      # Removing preinstalled bloat
      environment.gnome.excludePackages = with pkgs; [ gnome-tour ];
      services.xserver.excludePackages = with pkgs; [ xterm ];
      
}

