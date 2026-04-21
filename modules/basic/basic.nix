{
  flake.nixosModules.basic =
    { pkgs, ... }:
    {
      boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        kernelPackages = pkgs.linuxPackages_latest;
      };

      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "25.11";

      # Same time everywhere
      time.timeZone = "America/Chicago";

      catppuccin = {
        enable = true;
        accent = "peach";

        cursors = {
          enable = true;
          flavor = "mocha";
          accent = "blue";
        };
      };
      environment.systemPackages = with pkgs; [
        # Essentials
        helix
        git
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
        fira-code
        fira-code-symbols
        intel-one-mono
        iosevka-bin
        monaspace
      ];
    };
}
