{
  flake.nixosModules.coding =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        cargo
        go
        python315
        rustc

        ## Not really programming but it works
        ghidra
      ];
    };
}
