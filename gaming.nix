{ pkgs, config, lib, ... }:
{

  options = {
    gaming.enable = 
    lib.mkEnableOption "enables gaming specific tools";
  };

  config = lib.mkIf config.gaming.enable {
    # For Gaming stuff
    # Enabling hardware accelerated graphics drivers
    hardware.graphics.enable = true;
    # Enabling gpu drivers
    services.xserver.videoDrivers = ["amdgpu"];
    programs.gamemode.enable = true;
    # Enabling steam for Gaming
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;

    environment.systemPackages = with pkgs; [
      # nxengine-evo
      (retroarch.override {
        cores = with libretro; [
          desmume
          citra
        ];
      })
    ];
  };

}