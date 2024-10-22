let
  custom = {
    font = "Hurmit Nerd Font";
    fontsize = "12";
    primary_accent = "8FBCBB"; # Nord Frost - cyan-like color
    secondary_accent = "88C0D0"; # Nord Frost - light blue
    tertiary_accent = "E5E9F0"; # Nord Snow Storm - light whiteish color
    background = "2E3440"; # Nord Polar Night - background
    opacity = ".85";
    cursor = "Numix-Cursor";
    
    palette = {
      primary_background_rgba = "rgba(46, 52, 64, 0.85)"; # Nord Polar Night (background) - rgba with opacity
      secondary_background_rgba = "rgba(59, 66, 82, 0.85)"; # Slightly lighter shade from Nord Polar Night
      tertiary_background_rgba = "rgba(67, 76, 94, 0.85)"; # Even lighter for additional depth
      primary_background_hex = "2E3440"; # Nord Polar Night - darkest shade
      secondary_background_hex = "3B4252"; # Nord Polar Night - medium shade
      tertiary_background_hex = "434C5E"; # Nord Polar Night - lighter shade
    };
  };
in 
{
  #Overlays/Overrides
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      position= "top";
      layer= "top";
      height= 30;
      margin-top= 0;
      margin-bottom= 0;
      margin-left= 0;
      margin-right= 0;
      modules-left= [
        "clock#left" 
        "custom/playerctl#backward" 
        "custom/playerctl#play" 
        "custom/playerctl#foward" 
        "custom/playerlabel"
      ];
      modules-center= [
        "hyprland/workspaces"
      ];
      modules-right= [
        "tray"
        "power-profiles-daemon"
        "backlight"
        "pulseaudio" 
        "battery"
        "clock#right" 
      ];
      "hyprland/workspaces" = {
        "format" = "{icon}";
        "on-click" = "hyprctl dispatch workspace {name}";
        "format-icons" = {
          "1" = "一";
          "2" = "二";
          "3" = "三";
          "4" = "四";
          "5" = "五";
          "6" = "六";
          "7" = "七";
          "8" = "八";
          "9" = "九";
          "10" ="十";
        };
      }; 
      "clock#left"= {
        format = "{:%a %d %b}";
        tooltip= "true";
        tooltip-format= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt= " {:%d/%m}";
      };     
      "clock#right"= {
        format = "{:%H:%M:%S}";
        interval = 1;
      };
      "custom/playerctl#backward"= {
        format= "󰙣 "; 
        on-click= "playerctl previous";
        on-scroll-up = "playerctl volume .05+";
        on-scroll-down = "playerctl volume .05-";
      };
      "custom/playerctl#play"= {
        format= "{icon}";
        return-type= "json";
        exec= "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        on-click= "playerctl play-pause";
        on-scroll-up = "playerctl volume .05+";
        on-scroll-down = "playerctl volume .05-";
        format-icons= {
          Playing = "<span>󰏥 </span>";
          Paused = "<span> </span>";
          Stopped = "<span> </span>";
        };
      };
      "custom/playerctl#foward"= {
        format= "󰙡 ";
        on-click= "playerctl next";
        on-scroll-up = "playerctl volume .05+";
        on-scroll-down = "playerctl volume .05-";
      };
      "custom/playerlabel"= {
        format= "{}";
        return-type= "json";
        max-length= 40;
        exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        on-click= "";
      };
      battery= {
        states= {
          good= 95;
          warning= 30;
          critical= 15;
        };
        format="{icon}  {capacity}%";
        format-charging= "  {capacity}%";
        format-plugged= " {capacity}% ";
        format-alt= "{icon} {time}";
        format-icons= ["" "" "" "" ""];
      };

      memory= {
        format= "󰍛 {}%";
        format-alt= "󰍛 {used}/{total} GiB";
        interval= 5;
      };
      cpu= {
        format= "󰻠 {usage}%";
        format-alt= "󰻠 {avg_frequency} GHz";
        interval= 5;
      };
      network = {
        format-wifi = "  {signalStrength}%";
        format-ethernet = "󰈀 100% ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 0% ";
      };
      tray= {
        icon-size= 20;
        spacing= 8;
      };
      "backlight" = {
          "format" = "{icon} {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
      };
      "power-profiles-daemon" = {
        "format" = "{icon}";
        "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
        "tooltip" = true;
        "format-icons" = {
          "default" = "";
          "performance" = "";
          "balanced" = "";
          "power-saver" = "";
        };
      };
      pulseaudio= {
        format= "{icon} {volume}%";
        format-muted= "󰝟";
        format-icons= {
          default= ["󰕿" "󰖀" "󰕾"];
        };
        # on-scroll-up= "bash ~/.scripts/volume up";
        # on-scroll-down= "bash ~/.scripts/volume down";
        scroll-step= 5;
        on-click= "pavucontrol";
      };
    };
    style = ''
            * {
                border: none;
                border-radius: 0px;
                font-family: ${custom.font};
                font-size: 14px;
                min-height: 0;
            }

            window#waybar {
                background: ${custom.palette.primary_background_rgba};
            }
            #workspaces {
                background: #${custom.palette.tertiary_background_hex};
                margin: 5px 5px;
                padding: 8px 5px;
                border-radius: 16px;
                color: #${custom.primary_accent}
            }
            #workspaces button {
                padding: 0px 5px;
                margin: 0px 3px;
                border-radius: 16px;
                color: transparent;
                background: ${custom.palette.primary_background_rgba};
                transition: all 0.3s ease-in-out;
            }

            #workspaces button.active {
                background-color: #${custom.secondary_accent};
                color: #${custom.background};
                border-radius: 16px;
                min-width: 50px;
                background-size: 400% 400%;
                transition: all 0.3s ease-in-out;
            }
            #workspaces button:hover {
                background-color: #${custom.tertiary_accent};
                color: #${custom.background};
                border-radius: 16px;
                min-width: 50px;
                background-size: 400% 400%;
            }

            #tray, #pulseaudio, #power-profiles-daemon, #backlight, #network, #battery,
            #custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward{
                background: #${custom.palette.tertiary_background_hex};
                font-weight: bold;
                margin: 5px 0px;
            }
            #power-profiles-daemon {
                color: #${custom.tertiary_accent};
                border-radius: 0 0 0 0;
                padding: 0 20px 0 7px;
                margin-right: 0;
                margin-left: 0;
            }
            #tray {
                color: #${custom.tertiary_accent};
                border-radius: 10px 0px 0px 24px;
                padding: 0 7px 0 20px;
                margin-right: 0;
            }
            #pulseaudio, #backlight {
                color: #${custom.tertiary_accent};
                border-radius: 0px 0px 0px 0px;
                padding: 0 7px 0 7px;
                margin-left: 0;
                margin-right: 0;
            }
            #battery{
                color: #${custom.tertiary_accent};
                border-radius: 0px 24px 10px 0px;
                padding: 0 20px 0 7px;
                margin-left: 0;
            }
            #clock.right {
                color: #${custom.tertiary_accent};
                background: #${custom.palette.tertiary_background_hex};
                border-radius: 0px 0px 0px 40px;
                padding: 0 10px 0 25px;
                margin-left: 7px;
                font-weight: bold;
                font-size: 16px;
            }
            #clock.left {
                color: #${custom.secondary_accent};
                background: #${custom.palette.tertiary_background_hex};
                border-radius: 0px 0px 40px 0px;
                margin: 0px;
                padding: 0 25px 0 10px;
                font-size: 16px;
            }

            #custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward {
                background: #${custom.palette.tertiary_background_hex};
                font-size: 22px;
            }
            #custom-playerctl.backward:hover, #custom-playerctl.play:hover, #custom-playerctl.foward:hover{
                color: #${custom.tertiary_accent};
            }
            #custom-playerctl.backward {
                color: #${custom.primary_accent};
                border-radius: 24px 0px 0px 10px;
                padding-left: 16px;
                margin-left: 7px;
            }
            #custom-playerctl.play {
                color: #${custom.secondary_accent};
                padding: 0 5px;
            }
            #custom-playerctl.foward {
                color: #${custom.primary_accent};
                border-radius: 0px 0px 0px 0px;
                padding-right: 0px;
                margin-right: 0px
            }
            #custom-playerlabel {
                background: #${custom.palette.tertiary_background_hex};
                color: #${custom.tertiary_accent};
                padding: 0 20px;
                padding-left: 5px;
                border-radius: 0px 10px 24px 0px;
                margin: 5px 0;
                margin-left: 0px;
                font-weight: bold;
            }
            #window{
                background: #${custom.palette.tertiary_background_hex};
                padding-left: 15px;
                padding-right: 15px;
                border-radius: 16px;
                margin-top: 5px;
                margin-bottom: 5px;
                font-weight: normal;
                font-style: normal;
            }
        '';
  };
}
