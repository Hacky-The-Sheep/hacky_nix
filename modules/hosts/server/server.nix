{
  inputs,
  self,
  lib,
  ...
}:
{
  flake = {
    nixosConfigurations.server = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        server

        #Basic
        basic
        networking
        nix
      ];
    };
  };
}
