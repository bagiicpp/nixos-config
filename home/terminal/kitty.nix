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

      window_padding_width = "5 10";
      placement_strategy = "top-left";

      hide_window_decorations = "yes";

      cursor_shape = "beam";
      cursor_shape_unfocused = "hollow";
      cursor_beam_thickness = "1.5";

      copy_on_select = "clipboard";

      tab_bar_style = "hidden";

      confirm_os_window_close = "0";
    };
  };
}
