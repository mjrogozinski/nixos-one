{ pkgs, ... }:
{
  imports = [
    (import ./master.nix { username = "michal"; inherit pkgs; })
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "23.11";
}
