{ inputs, ... }:
{
  flake-file.inputs.nixos-hardware = {
    url = "github:NixOS/nixos-hardware/master";
  };

  flake.nixosModules.nixos-hardware-fw16 = {
    imports = [
      inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ];
  };

  flake.nixosModules.nixos-hardware-fwDesk = {
    imports = [
      inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ];
  };

}
