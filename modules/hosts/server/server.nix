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
    nixosConfigurations.server = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = with self.nixosModules; [
        server

        ## Basic
        # audio
        basic
        # bluetooth
        # desktop
        # openseas
        # printers
        networking
        nix
        services
        users

        ## Flakes
        # catppuccin
        # hyprland
        # nixos-hardware
        # noctalia

        ## Fun
        # content-creation

        ## Gaming
        # amd
        # games

        ## Programming
        formatters
      ];
    };

    ## Device specific packages that don't "fit" in a module
    nixosModules.server =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          xmrig
        ];

        ## Hostname
        networking.hostName = "mineYourOwn";

        imports = [
          inputs.home-manager.nixosModules.default
        ];

        home-manager.users.hacky = {
          imports = with self.homeModules; [

            # HM Modules
            base
            # work
            # desktop
            # general
            nushell
            ssh

          ];
        };

        home-manager.backupFileExtension = "backup";
      };
  };
}
