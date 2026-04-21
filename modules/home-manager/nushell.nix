{
  flake.homeModules.nushell = {
    programs.nushell = {
      enable = true;
      configFile.source = ../configs/config.nu;
    };
  };
}
