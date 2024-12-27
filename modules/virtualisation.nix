{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    distrobox
  ];

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation.podman.enable = true;
}
