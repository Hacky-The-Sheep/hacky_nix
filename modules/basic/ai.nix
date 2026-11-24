{
  flake.nixosModules.ai =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        opencode
        opencode-desktop
        ollama-rocm
      ];
    };
}
