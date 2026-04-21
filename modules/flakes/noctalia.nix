{
  pkgs,
  inputs,
  ...
}:
{
  flake-file.inputs.noctalia = {
    url = "github:noctalia-dev/noctalia-shell";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.noctalia = {
    environments.systemPackages = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
