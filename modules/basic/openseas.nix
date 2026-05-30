{
  flake.nixosModules.openseas =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fragments
      ];
    };
}
