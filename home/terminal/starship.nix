{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      format = "$os$username$hostname$directory$git_branch$git_status$line_break$character";

      os = {
        disabled = false;
        style = "bold #6FA8DC";

        symbols = {
          NixOS = "󱄅 ";
        };
      };

      username = {
        show_always = true;
        style_user = "bold #FFFFFF";
        style_root = "bold #FFFFFF";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bold #AAB4C0";
        format = "[@$hostname](#AAB4C0) ";
      };

      directory = {
        style = "bold #D5DCE5 bg:#1B2430";
        format = "[](#1B2430)[ $path ]($style)[](#1B2430) ";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "󰘬 ";
        style = "#6FA8DC";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        style = "#8FA8BF";
        format = "[$all_status$ahead_behind]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        success_symbol = "[❯](bold #6FA8DC)";
        error_symbol = "[❯](bold #D96C75)";
        vimcmd_symbol = "[❮](bold #6FA8DC)";
      };
    };
  };
}
