{
  flake.nixosModules.services = {
    services = {
      mullvad-vpn.enable = true;
      openssh.enable = true;
      tailscale.enable = true;

      resolved.enable = true;
    };
  };
}
