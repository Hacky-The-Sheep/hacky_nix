{
  inputs,
  ...
}:
{
  flake-file.inputs.dms = {
    url = "github:AvengeMedia/DankMaterialShell/stable";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.dms =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
