{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {
      programs = {
        niri.enable = true;
        dconf.enable = true;
      };

      ## Security
      security = {
        polkit.enable = true;
      };

      ## Keyring
      services.gnome.gnome-keyring.enable = true;

      environment.systemPackages = with pkgs; [
        ## CLI
        claude-code
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
        kopuz
        nautilus
        signal-desktop

        ## System
        exfat
        ffmpeg
        # handbrake
        hyprpolkitagent
        libdvdcss
        ntfs3g

        ## Tools
        dnsutils
        kdePackages.kwallet
        mullvad-vpn
        obsidian
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
