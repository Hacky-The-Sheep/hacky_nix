{
  ## Home Manager identity shared by every host
  flake.homeModules.base = {
    home = {
      stateVersion = "25.11";
      username = "hacky";
      homeDirectory = "/home/hacky";
    };
  };
}
