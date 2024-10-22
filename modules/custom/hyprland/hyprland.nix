{ pkgs, config, lib, inputs, ... }:
{
  options = {
    hyprland.enable = 
    lib.mkEnableOption "enables base hyprland";
  };

  config = lib.mkIf config.hyprland.enable {  
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    
    environment.systemPackages = with pkgs; [ 
      brightnessctl # to control brightness
      playerctl #Command-line utility and library for controlling media players that implement MPRIS
      networkmanagerapplet #NetworkManager control applet
      nemo # file manager
      pavucontrol # PulseAudio Volume control
      wvkbd # On-screen keyboard for wlroots
      cava # Console-based Audio Visualizer for Alsa
    ];

    # Enabling bluetooth stuff
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    # Screenrotation and iio-sensors
    hardware.sensor.iio.enable = true;
    programs.iio-hyprland.enable = true;   

  };

}
