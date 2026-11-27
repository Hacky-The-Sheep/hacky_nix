## work-ai: local LLM inference on workWork (RX 7900 XTX 24 GiB + ~125 GiB RAM).
## The Radeon 610M iGPU (gfx1036) is hidden from ROCm; only the 7900 XTX (gfx1100) is used.
{
  flake.nixosModules.work-ai =
    { pkgs, ... }:
    let
      # RX 7900 XTX, from `rocminfo`. A UUID survives device re-ordering, unlike an index.
      dGPU = "GPU-137dfe0dc78b66d2";
    in
    {
      ## Ollama (OpenAI-compatible API on 127.0.0.1:11434/v1)
      services.ollama = {
        enable = true;
        package = pkgs.ollama-rocm;
        # Pulled on service start; MoE, ~19 GB Q4, fits fully in VRAM with 32k context.
        loadModels = [ "qwen3:30b-a3b" ];
        environmentVariables = {
          ROCR_VISIBLE_DEVICES = dGPU;
          OLLAMA_FLASH_ATTENTION = "1";
          OLLAMA_KV_CACHE_TYPE = "q8_0";
          OLLAMA_CONTEXT_LENGTH = "32768";
          OLLAMA_KEEP_ALIVE = "30m";
          OLLAMA_MAX_LOADED_MODELS = "2";
        };
      };

      ## llama.cpp server for big MoE models with experts offloaded to system RAM
      ## (gpt-oss-120b, GLM-4.5-Air, Qwen3-235B-A22B at IQ3). Set `model`, then enable.
      services.llama-cpp = {
        enable = false;
        # gfx1100-only build: far faster to compile than all ROCm targets.
        # Alternative worth benchmarking: pkgs.llama-cpp.override { vulkanSupport = true; }
        package = pkgs.llama-cpp.override {
          rocmSupport = true;
          rocmGpuTargets = [ "gfx1100" ];
        };
        settings = {
          model = "/var/lib/models/CHANGE-ME.gguf";
          port = 8080;
          n-gpu-layers = 999;
          n-cpu-moe = 30; # raise until the model fits in 24 GiB VRAM
          ctx-size = 65536;
          flash-attn = "on";
          cache-type-k = "q8_0";
          cache-type-v = "q8_0";
          threads = 12; # physical cores; CPU side is memory-bandwidth bound
        };
      };
      systemd.services.llama-cpp.environment.ROCR_VISIBLE_DEVICES = dGPU;

      ## GPU control (power limit, compute profile, undervolt): `lact gui`
      services.lact.enable = true;

      ## Keep model weights in RAM instead of swapping them out
      boot.kernel.sysctl."vm.swappiness" = 10;

      ## opencode: layer the Ollama provider/model over the shared config (which points at fwdesk's forge)
      environment.sessionVariables.OPENCODE_CONFIG = "/home/hacky/hacky_nix/config/opencode/work.json";

      environment.systemPackages = with pkgs; [
        amdgpu_top
        nvtopPackages.amd
        rocmPackages.rocm-smi
      ];
    };
}
