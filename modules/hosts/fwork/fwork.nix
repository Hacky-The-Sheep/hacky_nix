{
  inputs,
  self,
  lib,
  ...
}:
{
  flake = {
    nixosConfigurations.fwork = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        fwork

        #Basic
        basic
        bluetooth
        desktop
        networking
        nix

        # Programming
        coding
        formatters
      ];
    };
  };
}
