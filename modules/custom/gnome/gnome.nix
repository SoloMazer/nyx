{ pkgs, config, lib, ... }:

{
  options = {
    gnome.enable = 
      lib.mkEnableOption "Enables Gnome desktop environment";
  };

  config = 
    lib.mkIf config.gnome.enable {
      
      # Enable the GNOME Desktop Environment.
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      services.gnome.core-utilities.enable = false;
      # Removing preinstalled bloat
      environment.gnome.excludePackages = with pkgs; [ gnome-tour ];
      services.xserver.excludePackages = with pkgs; [ xterm ];
      
      environment.systemPackages = with pkgs; [
        iio-sensor-proxy
      ];

      # Screenrotation and iio-sensors
      hardware.sensor.iio.enable = true;

    };
}

