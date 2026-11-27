## forge: local LLM inference servers (OpenAI-compatible API) built from ~/forge for this machine (-march=znver5).
## Update after committing in ~/forge:  nix flake update forge && sudo nixos-rebuild switch --flake .#fwdesk
{ inputs, ... }:
{
  flake-file.inputs.forge = {
    url = "git+file:///home/hacky/forge?ref=inkling-gpu";
    flake = false;
  };

  flake.nixosModules.forge =
    { pkgs, ... }:
    let
      forge = pkgs.callPackage "${inputs.forge}/default.nix" { };
      models = "%h/.lmstudio/models";
      server = description: model: args: {
        inherit description;
        wantedBy = [ "default.target" ];
        after = [ "default.target" ];
        # the Vulkan loader finds the RADV driver through this
        environment.XDG_DATA_DIRS = "/run/opengl-driver/share";
        serviceConfig = {
          ExecStart = "${forge}/bin/forge serve -m ${models}/${model} ${args}";
          Restart = "on-failure";
          RestartSec = 3;
        };
      };
    in
    {
      environment.systemPackages = [ forge ];

      ## journalctl --user -u forge -f   (per-request speed + prompt-cache reuse)
      systemd.user.services.forge =
        server "forge LLM server: Qwen3.5 9B (OpenAI-compatible API on 127.0.0.1:8181)"
          "mradermacher/DeepSeek-V4-Pro-Qwen3.5-9B-UNCENSORED-heretic-GGUF/DeepSeek-V4-Pro-Qwen3.5-9B-UNCENSORED-heretic.Q4_K_S.gguf"
          "--alias qwen3.5-9b --ctx 65536 --port 8181";

      systemd.user.services.forge-inkling =
        server "forge LLM server: Inkling 2 Mini (OpenAI-compatible API on 127.0.0.1:8182)"
          "lmstudio-community/Inkling-2-Mini-GGUF/Inkling-2-Mini-Q4_K_M.gguf"
          "--alias inkling-2-mini --ctx 65536 --port 8182";
    };
}
