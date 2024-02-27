{ username, pkgs, ... }:
{
  imports = [
    (import ./enable-sudo.nix { username = username; })
    (import ./passwordless-sudo.nix { username = username; })
  ];

  users.users.${username} = {
    isNormalUser = true;
    packages = with pkgs; [
      cowsay
      lolcat
      home-manager
      neovim
      git
      firefox
    ];
    initialPassword = username;
  };

  services.getty.autologinUser = username;
}
