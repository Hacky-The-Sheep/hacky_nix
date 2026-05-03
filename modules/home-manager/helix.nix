{
  flake.homeModules.helix = {
    programs.helix = {
      enable = true;

      settings = {
        theme = "catppuccin-mocha";

        editor = {
          auto-format = true;
          bufferline = "multiple";
          cursorline = true;
          line-number = "relative";
          true-color = true;

          lsp = {
            auto-signature-help = false;
          };

          statusline = {
            left = [
              "mode"
              "spinner"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            center = [ "file-name" ];
            right = [
              "selections"
              "position"
              "file-encoding"
              "file-line-ending"
              "file-type"
            ];

            mode = {
              normal = "NORMAL 🐧";
              insert = "INSERT 🚀";
              select = "SELECT  👆";
            };
          };

          cursor-shape = {
            insert = "bar";
            select = "underline";
          };

          indent-guides = {
            render = true;
          };
        };

        keys = {
          normal = {
            esc = [
              "collapse_selection"
              "keep_primary_selection"
            ];
            C-space = "signature_help";
            X = "extend_line_up";
            C-l = "extend_to_line_end";

            space = {
              w = ":write";
              q = ":quit";
              b = ":buffer-close";
            };
          };
        };
      };

      languages = {
        language = [
          {
            name = "rust";
            auto-format = true;
          }
          {
            name = "python";
            scope = "source.python";
            injection-regex = "python";
            file-types = [
              "py"
              "pyi"
              "py3"
              "pyw"
              ".pythonstartup"
              ".pythonrc"
            ];
            shebangs = [ "python" ];
            roots = [
              "."
              "pyproject.toml"
              "pyrightconfig.json"
            ];
            comment-token = "#";
            language-servers = [
              "pyright"
              "ruff"
              "pylsp"
            ];
            auto-format = true;
          }
          {
            name = "nix";
            language-servers = [ "nixd" ];
            auto-format = true;
          }
          {
            name = "markdown";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "md"
              ];
            };
            auto-format = true;
          }
        ];

        language-server = {
          qmlls = {
            command = "qmlls";
            args = [ "-E" ];
          };
        };
      };
    };
  };
}
