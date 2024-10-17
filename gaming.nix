{pkgs, ... }: 
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
}
