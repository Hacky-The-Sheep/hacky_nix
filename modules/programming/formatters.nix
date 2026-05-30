{
  flake.nixosModules.formatters =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ## Dev
        alejandra
        bash-language-server
        cargo
        clippy
        delve
        gopls
        kdePackages.qtdeclarative
        lua-language-server
        markdown-oxide
        marksman
        nixd
        nixfmt
        ruff
        rust-analyzer
        rustfmt
        stylua
        taplo
        vscode-langservers-extracted
        yaml-language-server
      ];
    };
}
