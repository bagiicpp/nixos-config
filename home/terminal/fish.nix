{ ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting
      fastfetch
    '';

    shellAliases = {
      cat = "bat";
      ls = "eza";
      ll = "eza -lah --icons";
      tree = "eza --tree";
      du = "dust";
      df = "duf";
      ps = "procs";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
