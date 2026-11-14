{
  flake.nixosModules.basic =
    { pkgs, ... }:
    {
      boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        kernelPackages = pkgs.linuxPackages_latest;
      };

      system.stateVersion = "25.11";

      # Same time everywhere
      time.timeZone = "America/Chicago";

      # catppuccin = {
      #   enable = true;
      #   accent = "peach";

      #   cursors = {
      #     enable = true;
      #     flavor = "mocha";
      #     accent = "blue";
      #   };
      # };
      environment.systemPackages = with pkgs; [
        # Essentials
        alacritty
        helix
        git
        ghostty
        ffmpeg
        tailscale
        unzip
        usbutils
        wget

        # CLI
        btop
        fastfetch
        fd
        nmap
        ripgrep
        sshs
        tree
        yazi
      ];

      # Fonts
      fonts.packages = with pkgs; [
        departure-mono
        fira-code
        fira-code-symbols
        ibm-plex
        intel-one-mono
        nerd-fonts.iosevka
        iosevka-bin
        monaspace
      ];
      fonts.fontconfig.defaultFonts = {
        sansSerif = [ "IBM Plex Sans" ];
        serif = [ "IBM Plex Serif" ];
        monospace = [ "Departure Mono" ];
      };
    };
}
