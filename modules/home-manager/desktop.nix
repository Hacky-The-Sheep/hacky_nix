{
  flake.homeModules.desktop = {

    ## GHOSTTY
    programs.ghostty = {
      enable = true;
      settings = {
        # Rice
        background-opacity = 0.4;
        background-blur = true;
        background-blur-radius = 45;

        # Title
        title = "󰮯 󰇘 󰊠 󰇘 󱙝 󰇘 ";

        # Font
        font-size = 16;
        font-family = "Iosevka";
      };
    };
  };
}
