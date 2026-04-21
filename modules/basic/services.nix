{
  flake.nixosModules.services = {
    services = {
      displayManager.ly.enable = true;

      mullvad-vpn.enable = true;
      openssh.enable = true;
      tailscale.enable = true;

      resolved.enable = true;
    };

  };
}
