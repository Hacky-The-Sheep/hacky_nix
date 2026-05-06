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
    nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
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
        laptop

        ## Basic
        audio
        basic
        bluetooth
        desktop
        openseas
        printers
        networking
        nix
        services
        udev
        upower
        users

        ## Flakes
        catppuccin
        # hyprland
        nixos-hardware
        noctalia

        ## Fun
        content-creation

        ## Gaming
        amd
        # games

        ## Programming
        coding
        formatters
      ];
    };

    ## Device specific packages that don't "fit" in a module
    nixosModules.laptop =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          calibre
        ];

        ## Hostname
        networking.hostName = "fWork";

        imports = [
          inputs.home-manager.nixosModules.default
        ];

        home-manager.users.hacky = {
          imports =
            (with self.homeModules; [

              # HM Modules
              desktop
              fastfetch
              general
              helix
              laphypr
              nushell
              ssh

            ])
            ++ [
              inputs.catppuccin.homeModules.catppuccin
            ];
        };

        home-manager.backupFileExtension = "backup";
      };
  };
}
