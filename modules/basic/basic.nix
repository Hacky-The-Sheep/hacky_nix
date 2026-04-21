{ pkgs, ... }:
{
  flake.nixosModules.basic = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages-latest;
    };

    # Same time everywhere
    time.timeZone = "America/Chicago";

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
