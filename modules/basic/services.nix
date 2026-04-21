{
  flake.nixosModules.services = {
    services = {
      mullvad-vpn.enable = true;
      tailscale.enable = true;
      openssh.enable = true;
      resolved.enable = true;
    };
    displayManager.ly.enable = true;

  };
}
