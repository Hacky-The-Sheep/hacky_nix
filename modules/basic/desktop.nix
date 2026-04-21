{
  flake.nixosModules.desktop = {pkgs, ...}: {
    programs = {
      niri.enable = true;
      dconf.enable = true;
    };

    ## Security
    security = {
      polkit.enable = true;
    };

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
      ## CLI
      ffuf
      gobuster
      john
      mpv
      openvpn
      rlwrap
      screen
      thc-hydra
      yt-dlp

      ## GUI
      brave
      gnome-disk-utility
      gvfs
      nautilus
      signal-desktop

      ## System
      exfat
      ffmpeg
      handbrake
      libdvdcss
      ntfs3g

      ## Tools
      dnsutils
      kdePackages.kwallet
      mullvad-vpn
      openssl
      syncthing

      ## Wayland / WM
      alsa-utils
      brightnessctl
      dunst
      grim
      networkmanager_dmenu
      slurp
      wl-clipboard
      xdg-desktop-portal-wlr
      xwayland-satellite

      ## Work
      libreoffice
      microsoft-edge
      onlyoffice-desktopeditors
      powershell
      remmina
      wireshark
    ];
  };
}
