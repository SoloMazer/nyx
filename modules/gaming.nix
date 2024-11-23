{ pkgs, inputs, ... }:
{
    # For Gaming stuff
    # Enabling hardware accelerated graphics drivers
    hardware.graphics.enable = true;
    # Enabling gpu drivers
    services.xserver.videoDrivers = ["amdgpu"];
    programs.gamemode.enable = true;
    # Enabling steam for Gaming
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;

    environment.systemPackages = [
      pkgs.bottles
      pkgs.lutris
      pkgs.heroic
      (pkgs.retroarch.override {
        cores = [
          pkgs.libretro.desmume
          inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.libretro.citra
        ];
      })
      # Recoding and editing software
      pkgs.obs-studio
      pkgs.kdenlive
    ];

}
