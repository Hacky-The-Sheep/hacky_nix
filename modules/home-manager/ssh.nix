{
  flake.homeModules.ssh =
    { lib, ... }:
    let
      legacy = {
        user = "admin";
        port = 22;
        extraOptions = {
          KexAlgorithms = "+diffie-hellman-group1-sha1,diffie-hellman-group14-sha1";
          HostKeyAlgorithms = "+ssh-rsa";
        };
      };
      modern = {
        user = "hacky";
        port = 22;
      };
      mk = base: hosts: lib.mapAttrs (_: ip: base // { hostname = ip; }) hosts;
    in
    {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;

        matchBlocks =
          mk legacy {
            serv_room = "192.168.2.80";
            Panth_Lounge = "192.168.2.10";
            Tech_Deck = "192.168.2.2";
            Counseling = "192.168.2.30";
            Women_Lock_Room = "192.168.2.50";
            Elec_Closet = "192.168.2.20";
            Band_Room = "192.168.2.60";
            Facilities = "192.168.2.90";
            Concession = "192.168.2.96";
            Press_Box = "192.168.2.97";
            Sci_Left = "192.168.2.130";
            Sci_Right = "192.168.2.131";
            Shed = "192.168.2.100";
          }
          // mk modern {
            Women_Lock_HP = "10.99.0.160";
            Asbestos_1 = "10.99.0.120";
            Asbestos_2 = "10.99.0.121";
            Elec_Closet_Bottom = "10.99.0.141";
            home = "192.168.1.100";
          }
          // {
            LegacyCisco = legacy // {
              hostname = "192.168.2.110";
              extraOptions = legacy.extraOptions // {
                Ciphers = "aes128-cbc";
              };
            };
          };
      };
    };
}
