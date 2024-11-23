{ pkgs, ... }: {
    # Get latest linux kernel (unsupported - may cause unexpected issues)
    boot.kernelPackages = pkgs.linuxPackages_latest;	
    # Loading graphics module at boot 
    boot.initrd.kernelModules = ["amdgpu"];
    # Enable Out Of Memory Daemon to help manage memory usage
    systemd.oomd.enable = true;
    #enabling zram and stuff
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      # swapDevices = 1; #(deafult is 1)
      #enabling the below setting causes some issues, will appear on startup screen, check later
      # writebackDevice = "/dev/disk/by-label/swap";
    };
    # swappiness - defining how aggressively to use the swap space
    boot.kernel.sysctl = { "vm.swappiness" = 25; };

    # Setup Automatic Upgrade
    system.autoUpgrade = {
      enable = true;
      dates = "daily 00:01";
      # for alternate days
      # dates = "Mon,Wed,Fri,Sun 04:40";
      flake = "/home/solomazer/.config/nixos/flake.nix";
      flags = [
        "--update-input" "nixpkgs"
        "--update-input" "nixpkgs-stable"
        "--update-input" "home-manager"
        "--update-input" "nixvim"
        "--update-input" "nix-flatpak"
        "--update-input" "nixos-cosmic"
        "--commit-lock-file"
        # "--override-input" - very intresting flag, look it up later
      ];
      allowReboot = true;
      rebootWindow = {
        #WARN: If working in reboot window, change timings to prevent reboot without notice.
        lower = "00:01";
        upper = "06:00";
      };
    };

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 15";
      flake = "/home/solomazer/.config/nixos";
    };
    boot.loader.systemd-boot.configurationLimit = 15; # Limit the number of generatizons

    # # Removing garbage periodically
    # nix.gc = {
    # # Check url below for more info:
    # # https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=nix.gc
    # automatic = true;
    # dates = "weekly";
    # options = "--delete-older-than 7d";
    # persistent = true;
    # };

    # Optimizing nix store periodically
    nix.optimise = {
    automatic = true;
    dates = ["weekly"];
    };
}
