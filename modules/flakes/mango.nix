{ inputs, ... }:
{
  flake-file.inputs.mango = {
    url = "github:mangowm/mango";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.mango =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
