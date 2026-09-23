{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "file";
        source = ./luffy.txt;

        color = {
          "1" = "white";
        };

        padding = {
          left = 1;
          right = 4;
        };
      };

      display = {
        separator = " ";

        color = {
          keys = "white";
          title = "white";
          output = "white";
        };

        percent = {
          type = [ "num" ];
          color = {
            green = "white";
            yellow = "white";
            red = "white";
          };
        };
      };

      modules = [
        "title"

        {
          type = "cpu";
          key = " CPU";
        }

        {
          type = "gpu";
          key = "󰢮 GPU";
          hideType = "integrated";
        }

        {
          type = "memory";
          key = " RAM";
          format = "{percentage}";
        }

        {
          type = "disk";
          key = " Disk";
          format = "{size-percentage}";
        }

        "break"

        {
          type = "os";
          key = "󱄅 OS";
        }

        {
          type = "kernel";
          key = " Kernel";
        }

        {
          type = "shell";
          key = " Shell";
        }

        {
          type = "wm";
          key = " WM";
        }

        "break"

        {
          type = "localip";
          key = "󰩟 Local IP";
        }

        {
          type = "packages";
          key = "󰏖 Packages";
        }

        {
          type = "uptime";
          key = "󰅐 Uptime";
        }

        "break"

        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
