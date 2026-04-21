{
  flake.nixosModules.openseas =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qbittorrent
        qbittorrent-cli
      ];
    };
}
