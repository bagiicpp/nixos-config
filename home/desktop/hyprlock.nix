{ ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = "/home/bagii/Pictures/Wallpapers/manonpole.webp";

          blur_passes = 3;
          blur_size = 7;

          brightness = 0.72;
          vibrancy = 0.15;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";

          font_size = 84;
          font_family = "Sans";
          color = "rgba(255, 255, 255, 0.95)";

          position = "0, 140";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "cmd[update:60000] date '+%A, %d %B'";

          font_size = 18;
          font_family = "Sans";
          color = "rgba(255, 255, 255, 0.65)";

          position = "0, 70";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";

          size = "300, 54";
          position = "0, -45";

          halign = "center";
          valign = "center";

          outline_thickness = 1;

          inner_color = "rgba(255, 255, 255, 0.10)";
          outer_color = "rgba(255, 255, 255, 0.28)";
          font_color = "rgba(255, 255, 255, 0.95)";

          rounding = 27;

          dots_size = 0.16;
          dots_spacing = 0.28;
          dots_center = true;

          fade_on_empty = false;

          placeholder_text =
            "<span foreground='##dfe7f2'>Enter Password</span>";

          shadow_passes = 3;
          shadow_size = 8;
          shadow_color = "rgba(0, 0, 0, 0.30)";
        }
      ];
    };
  };
}
