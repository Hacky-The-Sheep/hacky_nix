{
  pkgs,
  inputs,
  ...
}:
{
  flake-file.inputs.catppuccin = {
    url = "github:catppuccin/nix/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.catppuccin = {
    environment.systemPackages = with pkgs; [
      inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
