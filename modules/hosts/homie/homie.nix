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
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };
      };
      modules = with self.nixosModules; [
        homie

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
        users

        ## Flakes
        catppuccin
        hyprland
        # nixos-hardware
        noctalia

        ## Fun
        content-creation

        ## Gaming
        # amd
        # games

        ## Programming
        coding
        formatters
      ];
    };

    ## Device specific packages that don't "fit" in a module
    nixosModules.homie =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          gcr
          pandoc
          qFlipper
          xmrig
        ];

        ## Hostname
        networking.hostName = "homie";

        imports = [
          inputs.home-manager.nixosModules.default
        ];

        home-manager.users.hacky = {
          imports =
            (with self.homeModules; [

              ## HM Modules
              desktop
              general
              nushell
              # ssh
            ])
            ++ [
              inputs.catppuccin.homeModules.catppuccin
            ];

          catppuccin = {
            enable = true;
            accent = "peach";
            flavor = "mocha";
          };

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
          gtk = {
            enable = true;
            colorScheme = "dark";
            gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
            gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
          };

        };

        home-manager.backupFileExtension = "backup";
      };
  };
}
