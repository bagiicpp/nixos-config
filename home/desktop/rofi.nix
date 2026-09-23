{ config, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;

    extraConfig = {
      modes = "drun";
      show-icons = true;

      matching = "regex";
      drun-match-fields = "name";

      display-drun = "Launch:";
    };

    theme = {
      "*" = {
        font = "JetBrains Mono 11";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "#969A8F";

        margin = 0;
        padding = 0;
        spacing = 0;
      };

      window = {
        location = mkLiteral "center";
        width = 500;
        y-offset = -20;

        border-radius = mkLiteral "12px";
        border = 0;

        background-color = mkLiteral "#20292D";
      };

      mainbox = {
        padding = mkLiteral "8px";
        background-color = mkLiteral "#20292D";
      };

      inputbar = {
        background-color = mkLiteral "#31393B";

        border-radius = mkLiteral "6px";
        border = 0;

        padding = mkLiteral "8px 12px";
        spacing = mkLiteral "8px";
      };

      prompt = {
        text-color = mkLiteral "#C9C0A7";
        background-color = mkLiteral "transparent";
      };

      entry = {
        text-color = mkLiteral "#969A8F";

        placeholder = "search";
        placeholder-color = mkLiteral "#626964";

        background-color = mkLiteral "transparent";
      };

      listview = {
        background-color = mkLiteral "#20292D";

        margin = mkLiteral "8px 0px 0px";

        columns = 1;
        lines = 6;
        fixed-height = false;
      };

      element = {
        padding = mkLiteral "8px 10px";
        spacing = mkLiteral "6px";

        border-radius = mkLiteral "6px";
      };

      "element normal.normal" = {
        background-color = mkLiteral "#20292D";
        text-color = mkLiteral "#969A8F";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "#20292D";
        text-color = mkLiteral "#969A8F";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "#404847";
        text-color = mkLiteral "#C9C0A7";
      };

      "element normal.active" = {
        background-color = mkLiteral "#20292D";
        text-color = mkLiteral "#969A8F";
      };

      "element selected.normal" = {
        background-color = mkLiteral "#31393B";
        text-color = mkLiteral "#C9C0A7";
      };

      "element selected.active" = {
        background-color = mkLiteral "#31393B";
        text-color = mkLiteral "#C9C0A7";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "#404847";
        text-color = mkLiteral "#C9C0A7";
      };

      element-icon = {
        size = mkLiteral "1em";
        vertical-align = mkLiteral "0.5";

        background-color = mkLiteral "transparent";
      };

      element-text = {
        text-color = mkLiteral "inherit";
        background-color = mkLiteral "transparent";
      };

      message = {
        margin = mkLiteral "8px 0px 0px";

        border-radius = mkLiteral "8px";
        border = 0;

        background-color = mkLiteral "#20292D";
      };

      textbox = {
        padding = mkLiteral "8px 16px";
        background-color = mkLiteral "#20292D";
      };
    };
  };
}
