{
  flake.nixosModules.amd = { pkgs, ... }: {
    boot.initrd.kernelModules = [ "amdgpu" ];

    services.xserver.videoDrivers = [ "amdgpu" ];

    # OpenCL (ROCm runtime ICD)
    hardware.amdgpu.opencl.enable = true;

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [ mesa ];
    };

    environment.systemPackages = [ pkgs.rocmPackages.rocminfo ];

    # This is necesery because many programs hard-code the path to hip
    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

  };
}
