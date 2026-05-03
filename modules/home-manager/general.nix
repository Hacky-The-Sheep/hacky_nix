{
  flake.homeModules.general =
    { config, ... }:
    let
      dotfiles = "${config.home.homeDirectory}/hacky_nix/config";
      mkLink = name: {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${name}";
        recursive = true;
      };
    in
    {
      ## Home Manager
      home = {
        stateVersion = "25.11";
        username = "hacky";
        homeDirectory = "/home/hacky";
      };

      ## Catppuccin
      catppuccin = {
        enable = true;
        accent = "peach";
        flavor = "mocha";
      };

      ## GTK
      gtk = {
        enable = true;
        colorScheme = "dark";

        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
      };

      ## DCONF
      dconf.settings."org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      ## GIT
      programs = {
        git = {
          enable = true;
          settings = {
            user.name = "hacky";
            user.email = "jon.nguyen7@protonmail.com";
          };
        };
      };

      ## GNOME Keyring Service
      services.gnome-keyring.enable = true;

      ## XDG Config Files
      xdg.configFile = {
        niri = mkLink "niri";
        noctalia = mkLink "noctalia";
      };
    };
}
