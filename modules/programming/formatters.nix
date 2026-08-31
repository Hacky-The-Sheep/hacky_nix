{
  flake.nixosModules.formatters =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ## Dev
        alejandra
        bash-language-server
        lua-language-server
        nixd
        nixfmt
        stylua
        taplo
        vscode-langservers-extracted
        yaml-language-server
      ];
    };
}
