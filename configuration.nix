{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.michal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      cowsay
      lolcat
      home-manager
      neovim
      zsh
      oh-my-zsh
    ];
    initialPassword = "michal";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  system.stateVersion = "23.11";
  services.getty.autologinUser = "michal";

  # sudo without password
  security.sudo.extraRules= [
    {  users = [ "michal" ];
      commands = [
         { command = "ALL" ;
           options= [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
