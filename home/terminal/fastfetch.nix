{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        type = "builtin";
        source = "nixos_small";

        padding = {
          left = 1;
          right = 3;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [
        "title"
        "separator"

        {
          type = "os";
          key = "󱄅 OS";
        }
        {
          type = "host";
          key = "󰌢 Host";
        }
        {
          type = "kernel";
          key = " Kernel";
        }
        {
          type = "uptime";
          key = "󰅐 Uptime";
        }
        {
          type = "packages";
          key = "󰏖 Packages";
        }
        {
          type = "shell";
          key = " Shell";
        }
        {
          type = "wm";
          key = " WM";
        }
        {
          type = "terminal";
          key = " Terminal";
        }

        "break"

        {
          type = "cpu";
          key = " CPU";
        }
        {
          type = "gpu";
          key = "󰢮 GPU";
        }
        {
          type = "memory";
          key = " Memory";
        }
        {
          type = "disk";
          key = " Disk";
        }

        "break"
        "colors"
      ];
    };
  };
}
