{ config, pkgs, ... }:
{
  imports = [./michal.nix ./passwordless-sudo.nix];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "23.11";
}
