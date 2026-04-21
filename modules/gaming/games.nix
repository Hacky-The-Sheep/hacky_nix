{ pkgs, ... }:
{
  flake.nixosModules.games = {

    environment.systemPackages = with pkgs; [
      discord
      steam
      lutris
    ];
  };
}
