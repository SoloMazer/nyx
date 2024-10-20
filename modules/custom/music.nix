{ pkgs, config, lib, ... }:
{
  options = {
    music.enable = 
    lib.mkEnableOption "enables audio production specifc tools";
  };

  config = lib.mkIf config.music.enable {

    # For Ardour to work properly
    security.pam.loginLimits = [
      { domain = "@audio"; item = "memlock"; type = "hard"; value = "-1"; }
      { domain = "@audio"; item = "memlock"; type = "soft"; value = "-1"; }
    ];

    environment.systemPackages = with pkgs; [
        ardour
        vmpk
        mamba
    ];

  };
}
