{
  flake.homeModules.general = {
    # GHOSTTY
    programs.ghostty = {
      enable = true;
      settings = {
        # Rice
        background-opacity = 0.6;
        background-blur = true;
        background-blur-radius = 45;

        # Title
        title = "󰮯 󰇘 󰊠 󰇘 󱙝 󰇘 ";

        # Font
        font-size = 16;
        font-family = "Iosevka";
      };
    };

    # ROFI
    programs.rofi = {
      enable = true;
      font = "Iosevka 14";
    };
  };
}
