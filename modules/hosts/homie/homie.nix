{
  inputs,
  self,
  lib,
  ...
}:
{
  flake = {
    nixosConfigurations.homie = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        homie

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
