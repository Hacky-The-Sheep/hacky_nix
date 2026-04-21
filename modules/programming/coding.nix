{ pkgs, ... }:
{
  flake.nixosModules.coding = {
    environment.systemPackages = with pkgs; [
      cargo
      go
      python315
      rust
      rustc
    ];
  };
}
