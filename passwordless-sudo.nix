{ ... }:
{
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
