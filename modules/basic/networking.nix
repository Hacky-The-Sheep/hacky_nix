{
  flake.nixosModules.networking = {
    networking = {
      networkmanager.enable = true;
      firewall.trustedInterfaces = [ "tailscale0" ];
    };
  };
}
