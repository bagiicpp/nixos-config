{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      background_opacity = "0.75";
      dynamic_background_opacity = "yes";
      background_blur = "1";

      window_padding_width = 12;
      placement_strategy = "center";

      confirm_os_window_close = "0";
    };
  };
}
