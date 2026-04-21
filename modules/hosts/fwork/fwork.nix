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
        printers
        networking
        nix

        # Flakes
        catppuccin
        hyprland
        nixos-hardware
        noctalia

        # Programming
        coding
        formatters
      ];
    };
  };
}
