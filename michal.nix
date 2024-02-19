{ pkgs, ... }:
let masterUser = "michal";
in
{
  imports = [
    (import ./enable-sudo.nix { username = masterUser; })
    (import ./passwordless-sudo.nix { username = masterUser; })
  ];

  users.users.${masterUser} = {
    isNormalUser = true;
    packages = with pkgs; [
      cowsay
      lolcat
      home-manager
      neovim
    ];
    initialPassword = masterUser;
  };

  services.getty.autologinUser = masterUser;
}
