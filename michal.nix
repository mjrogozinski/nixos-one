{ pkgs, ... }:
{
  imports = [ ./passwordless-sudo.nix (import ./enable-sudo.nix { username = "michal"; })];

  users.users.michal = {
    isNormalUser = true;
    packages = with pkgs; [
      cowsay
      lolcat
      home-manager
      neovim
    ];
    initialPassword = "michal";
  };

  services.getty.autologinUser = "michal";
}
