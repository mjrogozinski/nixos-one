{ pkgs, ... }:
{
  users.users.michal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
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
