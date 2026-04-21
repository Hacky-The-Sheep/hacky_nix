{ inputs, ... }:
{
  flake-file.inputs.hyprland = {
    url = "github:hyprwm/Hyprland";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
