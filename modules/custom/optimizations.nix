{ config, pkgs, lib, ... }: {

  options = {
    optimizations.enable = 
    lib.mkEnableOption "enables device specific optimizations";
  };

  config = lib.mkIf config.optimizations.enable {

    # Nix Flakes setup
    nix = {
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
    #WARN: Opinionated: disable channels
    nix.channel.enable = false;

    # Bootloader.
    boot.loader = {
      systemd-boot.configurationLimit = 5; # Limit the number of generatizons
      timeout = 5; # bootloader timeout
    };

    # Get latest linux kernel (unsupported - may cause unexpected issues)
    boot.kernelPackages = pkgs.linuxPackages_latest;	
    # Loading graphics module at boot 
    # boot.initrd.kernelModules = ["amdgpu"];
    # Enable Out Of Memory Daemon to help manage memory usage
    systemd.oomd.enable = true;

    # Setup Automatic Upgrade
    system.autoUpgrade = {
      enable = true;
      dates = "daily";
      flake = "/home/solomazer/.config/nixos/flake.nix";
      flags = [
        "--update-input" "nixpkgs"
        "--update-input" "home-manager"
        "--update-input" "nixvim"
        "--update-input" "nix-flatpak"
        "--commit-lock-file"
      ];
      allowReboot = true;
      rebootWindow = {
        #WARN: If working in reboot window, change timings to prevent reboot without notice.
        lower = "00:00";
        upper = "06:00";
      };
    };

    # Removing garbage periodically
    nix.gc = {
    # Check url below for more info:
    # https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=nix.gc
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    persistent = true;
    };

    # Optimizing nix store periodically
    nix.optimise = {
    automatic = true;
    dates = ["weekly"];
    };

  };
}
