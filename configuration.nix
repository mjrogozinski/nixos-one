{ pkgs, ... }:
{
  imports = [
    (import ./master.nix { username = "michal"; inherit pkgs; })
    (import ./nvidia-gl.nix)
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  system.stateVersion = "23.11";
}
