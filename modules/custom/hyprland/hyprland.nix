{ pkgs, config, lib, inputs, ... }:
{

  options = {
    hyprland.enable = 
    lib.mkEnableOption "enables base hyprland";
  };

  config = lib.mkIf config.hyprland.enable {  
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

}
