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
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
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
        users

        ## Flakes
        catppuccin
        hyprland
        # nixos-hardware
        noctalia

        ## Fun
        content-creation

        ## Programming
        coding
        formatters
      ];
    };

    ## Device specific packages that don't "fit" in a module
    nixosModules.work =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          gcr
          pandoc
          qFlipper
          xmrig
        ];
      };

    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager.users.hacky = {
      imports = with self.homeModules; [

        # HM Modules
        work
        desktop
        general

      ];
      home = {
        stateVersion = "25.11";
        username = "hacky";
        homeDirectory = "/home/hacky";
      };

      ## Dark mode for GTK
      dconf = {
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };
      };

      ## The Cat
      catppuccin = {
        enable = true;
        accent = "peach";

        cursors = {
          enable = true;
          flavor = "mocha";
          accent = "blue";
        };
      };
    };

    home-manager.backupFileExtension = "backup";
  };
}
