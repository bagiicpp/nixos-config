{ ... }:

{
  programs.rofi = {
    enable = true;

    extraConfig = {
      modi = "drun,run";
      show-icons = true;
      display-drun = "Apps";
      display-run = "Run";
      drun-display-format = "{name}";
    };

    theme = {
      "*" = {
        font = "JetBrainsMono Nerd Font 12";

        background = "#20292ddd";
        background-alt = "#354043cc";

        foreground = "#c9c0a7";
        muted = "#969a8f";

        selected = "#b8cdcb";
        selected-foreground = "#20292d";

        border = "#809b9b";
      };

      window = {
        width = "38%";
        border = 1;
        border-color = "@border";
        border-radius = 22;

        background-color = "@background";

        padding = 14;
      };

      mainbox = {
        spacing = 12;
        padding = 8;

        background-color = "transparent";
      };

      inputbar = {
        spacing = 10;
        padding = 14;

        border-radius = 16;

        background-color = "#ffffff10";
        text-color = "@foreground";

        children = [
          "prompt"
          "entry"
        ];
      };

      prompt = {
        text-color = "@muted";
      };

      entry = {
        placeholder = "Search applications...";
        placeholder-color = "@muted";

        text-color = "@foreground";
      };

      listview = {
        lines = 7;
        columns = 1;

        spacing = 6;
        padding = 4;

        scrollbar = false;

        background-color = "transparent";
      };

      element = {
        padding = 10;
        spacing = 12;

        border-radius = 14;

        background-color = "transparent";
        text-color = "@foreground";
      };

      "element selected" = {
        background-color = "@selected";
        text-color = "@selected-foreground";
      };

      element-icon = {
        size = 24;
        background-color = "transparent";
      };

      element-text = {
        vertical-align = "0.5";
        background-color = "transparent";
        text-color = "inherit";
      };
    };
  };
}
