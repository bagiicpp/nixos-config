{ ... }:

{
  programs.vicinae = {
    enable = true;

    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      font = {
        normal = {
          size = 12;
          family = "JetBrainsMono Nerd Font Mono";
        };
      };
    };
  };
}
