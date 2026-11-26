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
    nixosConfigurations.work = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self;
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };
      };
      modules = with self.nixosModules; [
        work

        ## Basic
        audio
        basic
        bluetooth
        desktop
        # openseas
        printers
        networking
        nix
        services
        udev
        users

        ## Flakes
        catppuccin
        hyprland
        # nixos-hardware
        noctalia

        ## Fun
        content-creation

        ## Gaming
        amd
        games

        ## Programming
        formatters
      ];
    };

    ## Device specific packages that don't "fit" in a module
    nixosModules.work =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          # gcr
          claude-code
          pandoc
          qFlipper
          xmrig
        ];

        ## Hostname
        networking.hostName = "workWork";

        imports = [
          inputs.home-manager.nixosModules.default
        ];

        home-manager.users.hacky = {
          imports =
            (with self.homeModules; [

              # HM Modules
              base
              # work
              # desktop
              general
              ssh
            ])
            ++ [
              inputs.catppuccin.homeModules.catppuccin
            ];

          catppuccin = {
            enable = true;
            accent = "peach";
            flavor = "mocha";
          };

        };

        home-manager.backupFileExtension = "backup";
      };
  };
}
