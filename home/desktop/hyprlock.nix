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

          blur_passes = 2;
          blur_size = 4;

          contrast = 0.85;
          brightness = 0.62;

          vibrancy = 0.12;
          vibrancy_darkness = 0.05;
        }
      ];

      label = [
        # Date
        {
          monitor = "";
          text = "cmd[update:10000] date '+%A, %B %d'";

          color = "rgba(201, 192, 167, 0.72)";
          font_size = 25;
          font_family = "JetBrainsMono Nerd Font";

          position = "0, 250";
          halign = "center";
          valign = "center";
        }

        # Time
        {
          monitor = "";
          text = "cmd[update:1000] date '+%H:%M'";

          color = "rgba(201, 192, 167, 0.92)";
          font_size = 120;
          font_family = "JetBrainsMono Nerd Font";

          position = "0, 150";
          halign = "center";
          valign = "center";
        }

        # User
        {
          monitor = "";
          text = "  $USER";

          color = "rgba(201, 192, 167, 0.88)";
          font_size = 18;
          font_family = "JetBrainsMono Nerd Font";

          position = "0, -50";
          halign = "center";
          valign = "center";
        }

        # Suspend
	{
	  monitor = "";
	  text = "<span>󰤄 </span>";

	  color = "rgba(201, 192, 167, 0.70)";
	  font_size = 42;
	  font_family = "JetBrainsMono Nerd Font";

	  onclick = "systemctl suspend";

	  position = "-120, 80";
	  halign = "center";
	  valign = "bottom";
	}

	# Reboot
	{
	  monitor = "";
	  text = "<span>󰜉 </span>";

	  color = "rgba(201, 192, 167, 0.70)";
	  font_size = 42;
	  font_family = "JetBrainsMono Nerd Font";

	  onclick = "reboot";

	  position = "0, 80";
	  halign = "center";
	  valign = "bottom";
	}

	# Power off
	{
	  monitor = "";
	  text = "<span>󰐥 </span>";

	  color = "rgba(201, 192, 167, 0.70)";
	  font_size = 42;
	  font_family = "JetBrainsMono Nerd Font";

	  onclick = "poweroff";

	  position = "120, 80";
	  halign = "center";
	  valign = "bottom";
	}
      ];

      shape = [
        # User pill
        {
          monitor = "";

          size = "300, 60";
          color = "rgba(49, 57, 59, 0.72)";

          rounding = 30;

          border_size = 1;
          border_color = "rgba(150, 154, 143, 0.22)";

          position = "0, -50";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";

          size = "300, 60";
          position = "0, -130";

          halign = "center";
          valign = "center";

          outline_thickness = 1;

          inner_color = "rgba(49, 57, 59, 0.72)";
          outer_color = "rgba(150, 154, 143, 0.22)";
          font_color = "rgba(201, 192, 167, 0.95)";
          check_color = "rgba(201, 192, 167, 0.95)";

          rounding = 30;

          dots_size = 0.16;
          dots_spacing = 0.28;
          dots_center = true;

          fade_on_empty = false;
          hide_input = false;

          font_family = "JetBrainsMono Nerd Font";

          placeholder_text =
            "<span foreground='##969a8fcc'>Password</span>";

          shadow_passes = 3;
          shadow_size = 8;
          shadow_color = "rgba(0, 0, 0, 0.28)";
        }
      ];
    };
  };
}
