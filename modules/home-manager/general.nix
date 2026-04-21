{
  flake.homeModules.general = {

    ######################################################
    ########               HELIX                   #######
    ######################################################
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

    ######################################################
    ########               FASTFETCH               #######
    ######################################################
    programs.fastfetch = {
      enable = true;
      settings = {
        modules = [
          "break"
          {
            type = "custom";
            format = "┌────────────────────── Hardware ──────────────────────┐";
            outputColor = "red";
          }
          {
            type = "title";
            key = "  PC";
            keyColor = "green";
          }
          {
            type = "cpu";
            key = "│ ├󰍛 CPU";
            showPeCoreCount = true;
            format = "{1}";
            keyColor = "green";
          }
          {
            type = "gpu";
            key = "│ ├󰍛 GPU";
            keyColor = "green";
          }
          {
            type = "memory";
            key = "│ ├󰍛 Memory";
            keyColor = "green";
          }
          {
            type = "storage";
            key = "└ └󰍛 Storage";
            keyColor = "green";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────────────────┘";
            outputColor = "red";
          }
          "break"
          {
            type = "custom";
            format = "┌────────────────────── Software ──────────────────────┐";
            outputColor = "red";
          }
          {
            type = "os";
            key = " OS";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = "│ ├ Kernel";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "│ ├󰏖 Packages";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "│ ├ Shell";
            keyColor = "yellow";
          }
          {
            type = "command";
            key = "│ ├ OS Age";
            keyColor = "yellow";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
          }
          {
            type = "uptime";
            key = "└ └ Uptime";
            keyColor = "yellow";
          }
          "break"
          {
            type = "de";
            key = " DE";
            keyColor = "blue";
          }
          {
            type = "lm";
            key = "│ ├ LM";
            keyColor = "blue";
          }
          {
            type = "wm";
            key = "│ ├ WM";
            keyColor = "blue";
          }
          {
            type = "gpu";
            key = "│ ├󰍛 GPU Driver";
            format = "{3}";
            keyColor = "blue";
          }
          {
            type = "wmtheme";
            key = "└ └󰉼 Theme";
            keyColor = "blue";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────────────────┘";
            outputColor = "red";
          }
          "break"
          {
            type = "custom";
            format = "                Our Lady - Pray for Us                  ";
            outputColor = "blue";
          }
        ];
      };
    };
  };
}
