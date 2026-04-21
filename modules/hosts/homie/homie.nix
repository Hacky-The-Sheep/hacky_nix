{
  inputs,
  self,
  lib,
  ...
}:
{
    flake-file.inputs.home-manager = {
      url = lib.mkDefault "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    imports = [
      inputs.home-manager.flakeModules.home-manager
    ];

    flake = {
      nixosConfigurations.homie = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs self;
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        };
        modules = with self.nixosModules; [
          homie

          #Basic
          audio
          basic
          bluetooth
          desktop
          printers
          networking
          nix

          # Flakes
          catppuccin
          hyprland
          # nixos-hardware
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
          

          # HM Modules
          desktop
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
}
