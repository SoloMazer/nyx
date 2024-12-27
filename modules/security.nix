{ pkgs, ... }: {
  #AppArmor stuff
  security.dbus.apparmor = "enabled";
  security.apparmor.enable = true;
}
