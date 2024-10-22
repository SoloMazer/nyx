{ config, lib, ... }:
{
  options = {
    flatpak.enable = 
    lib.mkEnableOption "enables nix-flatpak to manage flatpaks declaratively";
  };

  config = lib.mkIf config.flatpak.enable {
    services.flatpak = {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
      packages = [
        "com.github.scrivanolabs.scrivano"
        "com.github.tchx84.Flatseal"
      ];
    };
  };
}
