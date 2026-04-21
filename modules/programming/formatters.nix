{ pkgs, ... }:
{
  flake.nixosModules.formatters = {
    environment.systemPackages = with pkgs; [
      ## Dev
      alejandra
      cargo
      clippy
      delve
      gopls
      markdown-oxide
      marksman
      nixd
      nixfmt
      ruff
      rust-analyzer
      rustfmt
      taplo
      vscode-langservers-extracted
      yaml-language-server
    ];
  };
}
