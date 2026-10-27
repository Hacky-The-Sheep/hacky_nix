{
  flake.nixosModules.users =
    { pkgs, ... }:
    {
      users.users.hacky = {
        isNormalUser = true;
        uid = 1000;
        shell = pkgs.nushell;

        extraGroups = [
          "dialout"
          "libvirtd"
          "lp"
          "networkmanager"
          "optical"
          "plugdev"
          "render"
          "wheel"
          "video"
        ];
      };
    };
}
