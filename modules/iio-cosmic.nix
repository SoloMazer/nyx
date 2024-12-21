{ pkgs, ... }:

let
  # Script to handle rotation
  iio-cosmic = pkgs.writeShellScriptBin "iio-cosmic" ''
    #!${pkgs.bash}/bin/bash
    while true; do  
      ${pkgs.iio-sensor-proxy}/bin/monitor-sensor | while IFS= read -r line
      do
        if [[ $line == *"Accelerometer orientation changed:"* ]]; then
          orientation=$(echo "$line" | ${pkgs.gawk}/bin/awk -F': ' '{print $2}')
          case "$orientation" in
            "normal")
              ${pkgs.cosmic-randr}/bin/cosmic-randr mode eDP-1 1920 1200 --transform normal
              ;;
            "left-up")
              ${pkgs.cosmic-randr}/bin/cosmic-randr mode eDP-1 1920 1200 --transform rotate90
              ;;
            "right-up")
              ${pkgs.cosmic-randr}/bin/cosmic-randr mode eDP-1 1920 1200 --transform rotate270
              ;;
            "bottom-up")
              ${pkgs.cosmic-randr}/bin/cosmic-randr mode eDP-1 1920 1200 --transform rotate180
              ;;
          esac
        fi
      done
      sleep 1 # Prevent tight loop if monitor-sensor fails
    done
  '';
in
{
  # Enable IIO sensor support - this will handle iio-sensor-proxy installation
  hardware.sensor.iio.enable = true;

  # Create systemd user service for auto-rotation
  systemd.services.iio-cosmic = {
    description = "Automatic screen rotation service";
    wantedBy = [ "graphical.target" ];
    after = [ "graphical.target" "iio-sensor-proxy.service"];
    requires = ["iio-sensor-proxy.service"];

    serviceConfig = {
      ExecStart = "${iio-cosmic}/bin/iio-cosmic";
      Restart = "on-failure";
      RestartSec = "5s";
      Environment = [
        "DISPLAY=:1"
        "WAYLAND_DISPLAY=wayland-1"
        "XDG_RUNTIME_DIR=/run/user/1000" 
      ];
    };

  };

  # If your accelerometer needs a specific mount matrix, uncomment and modify this
  # services.udev.extraHwdb = ''
  #   # Replace with your device's modalias pattern
  #   # sensor:modalias:acpi:XXXX*:dmi:*
  #   #  ACCEL_MOUNT_MATRIX=0, 1, 0; 1, 0, 0; 0, 0, 1
  # '';
}


