{ pkgs, config, lib, ... }:
{

  options = {
    virtualisation.enable = 
    lib.mkEnableOption "Enables virtualisation specific tools";
  };

config = lib.mkIf config.virtualisation.enable {
    environment.systemPackages = with pkgs; [
      distrobox
    ];

    # Virtualization
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
    virtualisation.podman.enable = true;
  };
}
