{
  inputs,
  self,
  lib,
  ...
}:
{
  flake = {
    flake-file.inputs.home-manager = {
      url = lib.mkDefault "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    imports = [
      inputs.home-manager.flakeModules.home-manager
    ];

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

      imports = [
        inputs.home-manager.nixosModules.default
      ];

      home-manager.users.hacky = {
        imports = with self.homeModules; [
          fwork
          general
        ];
        home = {
          stateVersion = "25.11";
          username = "hacky";
          homeDirectory = "/home/hacky";
        };
      };

      home-manager.backupFileExtension = "backup";
    };
  };
}
