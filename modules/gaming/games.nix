{
  flake.nixosModules.games =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        discord
        steam
        # lutris
      ];
    };
}
