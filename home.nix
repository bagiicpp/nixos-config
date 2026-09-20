{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.vicinae.homeManagerModules.default

    ./home/defaults.nix

    ./home/desktop/hyprlock.nix
    ./home/desktop/rofi.nix
    ./home/desktop/noctalia.nix
    ./home/desktop/vicinae.nix

    ./home/terminal/kitty.nix
    ./home/terminal/fish.nix
    ./home/terminal/starship.nix

    ./home/tools/yazi.nix
    ./home/tools/git.nix
  ];

  home.username = "bagii";
  home.homeDirectory = "/home/bagii";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    kdePackages.kate
    uv
    python313
  ];
}
