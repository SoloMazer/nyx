{ pkgs, config, lib, inputs, ... }:
{
  options = {
    hyprhm.enable = 
    lib.mkEnableOption "enables home-manager hyprland module";
  };
  config = lib.mkIf config.hyprhm.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      plugins = [
        # inputs.hyprland-plugins.packages."${pkgs.system}".hyprexpo
        # inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      ];
      settings = {

        # This is an example Hyprland config file.
        # Refer to the wiki for more information.
        # https://wiki.hyprland.org/Configuring/Configuring-Hyprland/

        # Please note not all available settings / options are set here.
        # For a full list, see the wiki

        # You can split this configuration into multiple files
        # Create your files separately and then link them to this file like this:
        # source = ~/.config/hypr/myColors.conf


        ################
        ### MONITORS ###
        ################

        # See https://wiki.hyprland.org/Configuring/Monitors/
        monitor = "eDP-1,1920x1200@60,0x0,1";


        ###################
        ### MY PROGRAMS ###
        ###################

        # See https://wiki.hyprland.org/Configuring/Keywords/

        # Set programs that you use
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = "rofi -show drun -show-icons" ;


        #################
        ### AUTOSTART ###
        #################

        # Autostart necessary processes (like notifications daemons, status bars, etc.)
        # Or execute your favorite apps at launch like this:

        exec-once = [ 
          "$terminal"
          "hyprpaper"
          "waybar"
          "iio-hyprland"
          "nm-applet --indicator"
        ];


        #############################
        ### ENVIRONMENT VARIABLES ###
        #############################

        # See https://wiki.hyprland.org/Configuring/Environment-variables/

        env = [ 
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
        ];

        #####################
        ### LOOK AND FEEL ###
        #####################

        # Refer to https://wiki.hyprland.org/Configuring/Variables/

        # https://wiki.hyprland.org/Configuring/Variables/#general
        general = {
            gaps_in = "5";
            gaps_out = "10";

            border_size = "3";

            # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
            "col.active_border" = "rgba(8fbcbbee) rgba(88c0d0ee) rgba(81a1c1ee) rgba(5e81acee) 45deg";
            "col.inactive_border" = "rgba(4c566aaa)";

            # Set to true enable resizing windows by clicking and dragging on borders and gaps
            resize_on_border = "true";

            # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
            allow_tearing = "false";
            resize_corner = "0";

            layout = "dwindle";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#decoration
        decoration = {
            rounding = "7";
            # Change transparency of focused and unfocused windows
            active_opacity = "0.95";
            fullscreen_opacity = "0.95";
            inactive_opacity = "0.9";

            drop_shadow = "true";
            shadow_range = "4";
            shadow_render_power = "3";
            "col.shadow" = "rgba(1a1a1aee)";

            # https://wiki.hyprland.org/Configuring/Variables/#blur
            blur = {
                enabled = "true";
                size = "3";
                passes = "1";
                vibrancy = "0.1696";
            };
        };

        # https://wiki.hyprland.org/Configuring/Variables/#animations
        animations = {
            enabled = true;

            # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
              "windows, 1, 7, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 7, default"
              "workspaces, 1, 6, default"
            ];
        };

        # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
        # "Smart gaps" / "No gaps when only"
        # uncomment all if you wish to use that.
        # workspace = w[t1], gapsout:0, gapsin:0
        # workspace = w[tg1], gapsout:0, gapsin:0
        # workspace = f[1], gapsout:0, gapsin:0
        # windowrulev2 = bordersize 0, floating:0, onworkspace:w[t1]
        # windowrulev2 = rounding 0, floating:0, onworkspace:w[t1]
        # windowrulev2 = bordersize 0, floating:0, onworkspace:w[tg1]
        # windowrulev2 = rounding 0, floating:0, onworkspace:w[tg1]
        # windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
        # windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        dwindle = {
            pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true; # You probably want this
        };

        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        master = {
            new_status = "master";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#misc
        misc = {
            force_default_wallpaper = "-1"; # Set to 0 or 1 to disable the anime mascot wallpapers
            disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
        };


        #############
        ### INPUT ###
        #############

        # https://wiki.hyprland.org/Configuring/Variables/#input
        input = {
            kb_layout = "us";
            # kb_variant =;
            # kb_model =;
            # kb_options =;
            # kb_rules =;

            follow_mouse = 1;

            sensitivity = 0.7; # -1.0 - 1.0, 0 means no modification.

            touchpad = {
                natural_scroll = true;
            };
        };

        # https://wiki.hyprland.org/Configuring/Variables/#gestures
        gestures = {
          workspace_swipe = false;
        };

        # Example per-device config
        # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
        device = {
            name = "epic-mouse-v1";
            sensitivity = "-0.5";
        };


        ###################
        ### KEYBINDINGS ###
        ###################

        # See https://wiki.hyprland.org/Configuring/Keywords/
        "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = [
          "$mainMod, Q, exec, $terminal"
          "$mainMod, C, killactive,"
          "$mainMod, M, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, R, exec, $menu"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod, J, togglesplit, # dwindle"
          "$mainMod, B, exec, pkill -SIGUSR1 waybar"
          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          # Plugin bindings for hyprexpo
          # "SUPER, grave, hyprexpo:expo, toggle"
        ];

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [ 
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        # Laptop multimedia keys for volume and LCD brightness
        bindel = [ 
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];
        # Requires playerctl
        bindl = [ 
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        ##############################
        ### WINDOWS AND WORKSPACES ###
        ##############################

        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

        # Example windowrule v1
        # windowrule = float, ^(kitty)$

        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

        # Ignore maximize requests from apps. You'll probably like this.
        windowrulev2 = [
          "suppressevent maximize, class:.*" 
          # Fix some dragging issues with XWayland
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"       
        ];

        ###############
        ### PLUGINS ###
        ###############
        # plugin = { 
        #   hyprexpo = {
        #     columns = 3;
        #     gap_size = 5;
        #     bg_col = "rgb(111111)";
        #     workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1
        #
        #     enable_gesture = "true"; # laptop touchpad
        #     gesture_fingers = "3";  # 3 or 4
        #     gesture_distance = "300"; # how far is the "max"
        #     gesture_positive = "true"; # positive = swipe down. Negative = swipe up.
        #   };
        # };
        # "plugin:dynamic-cursors" = {
        #   # enables the plugin
        #   enabled = true;
        #
        #   # sets the cursor behaviour, supports these values:
        #   # tilt    - tilt the cursor based on x-velocity
        #   # rotate  - rotate the cursor based on movement direction
        #   # stretch - stretch the cursor shape based on direction and velocity
        #   # none    - do not change the cursors behaviour
        #   mode = "stretch";
        #
        #   # minimum angle difference in degrees after which the shape is changed
        #   # smaller values are smoother, but more expensive for hw cursors
        #   threshold = 2;
        #   # for mode = stretch
        #   stretch = {
        #     # controls how much the cursor is stretched
        #     # this value controls at which speed (px/s) the full stretch is reached
        #     limit = 3000;
        #
        #     # relationship between speed and stretch amount, supports these values:
        #     # linear             - a linear function is used
        #     # quadratic          - a quadratic function is used
        #     # negative_quadratic - negative version of the quadratic one, feels more aggressive
        #     function = "quadratic";
        #   };
        # };

      };
    };
    
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [ 
          "/home/solomazer/Pictures/Wallpapers/ign_AnimeRoomBoard-2.jpg" 
        ];

        wallpaper = [
          ",/home/solomazer/Pictures/Wallpapers/ign_AnimeRoomBoard-2.jpg"
        ];
      };
    };

    # Enable the mako notifications daemon
    services.mako = {
      enable = true;
    };

  };
}
