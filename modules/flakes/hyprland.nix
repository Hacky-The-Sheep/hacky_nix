{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        hyprland
      ];
    };
}
