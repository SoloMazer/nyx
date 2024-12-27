{ config
, pkgs
, lib
, ...
}: {
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    cantarell-fonts
  ];
}
