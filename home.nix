{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.vicinae.homeManagerModules.default
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = "qimgv.desktop";
      "image/png" = "qimgv.desktop";
      "image/webp" = "qimgv.desktop";
      "image/gif" = "qimgv.desktop";
      "image/bmp" = "qimgv.desktop";
      "image/tiff" = "qimgv.desktop";

      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/chrome" = "zen.desktop";
      "text/html" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
    };
  };

  programs.yazi = {
    enable = true;

    enableFishIntegration = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
	ratio = [ 1 3 4 ];

	sort_by = "natural";
	sort_sensitive = false;
	sort_reverse = false;
	sort_dir_first = true;

	linemode = "size";

	show_hidden = false;
	show_symlink = true;
      };

      preview = {
	tab_size = 2;
	image_quality = 90;
      };
    };

    # Frostbound
    # Custom palette based on the current wallpaper.
    theme = {
      app = {
	overall = {
	  bg = "#20292d";
	};
      };

      mgr = {
	cwd = {
	  fg = "#c9c0a7";
	  bold = true;
	};

	hovered = {
	  fg = "#20292d";
	  bg = "#aebfbd";
	  bold = true;
	};

	preview_hovered = {
	  fg = "#20292d";
	  bg = "#969a8f";
	};

	find_keyword = {
	  fg = "#d9d2ba";
	  bold = true;
	  underline = true;
	};

	find_position = {
	  fg = "#969a8f";
	  bg = "#2e3638";
	};

	symlink_target = {
	  fg = "#809b9b";
	  italic = true;
	};

	marker_copied = {
	  fg = "#aebfbd";
	  bg = "#aebfbd";
	};

	marker_cut = {
	  fg = "#c79a8b";
	  bg = "#c79a8b";
	};

	marker_marked = {
	  fg = "#c9c0a7";
	  bg = "#c9c0a7";
	};

	marker_selected = {
	  fg = "#b8cdcb";
	  bg = "#b8cdcb";
	};

	count_copied = {
	  fg = "#20292d";
	  bg = "#aebfbd";
	};

	count_cut = {
	  fg = "#20292d";
	  bg = "#c79a8b";
	};

	count_selected = {
	  fg = "#20292d";
	  bg = "#b8cdcb";
	};

	border_symbol = "│";

	border_style = {
	  fg = "#404847";
	};
      };

      tabs = {
	active = {
	  fg = "#20292d";
	  bg = "#c9c0a7";
	  bold = true;
	};

	inactive = {
	  fg = "#969a8f";
	  bg = "#252e31";
	};
      };

      mode = {
	normal_main = {
	  fg = "#20292d";
	  bg = "#b8cdcb";
	  bold = true;
	};

	normal_alt = {
	  fg = "#b8cdcb";
	  bg = "#354043";
	};

	select_main = {
	  fg = "#20292d";
	  bg = "#c9c0a7";
	  bold = true;
	};

	select_alt = {
	  fg = "#c9c0a7";
	  bg = "#354043";
	};

	unset_main = {
	  fg = "#20292d";
	  bg = "#969a8f";
	  bold = true;
	};

	unset_alt = {
	  fg = "#969a8f";
	  bg = "#354043";
	};
      };

      status = {
	overall = {
	  fg = "#969a8f";
	  bg = "#20292d";
	};

	sep_left = {
	  open = "";
	  close = "";
	};

	sep_right = {
	  open = "";
	  close = "";
	};

	progress_label = {
	  fg = "#c9c0a7";
	  bold = true;
	};

	progress_normal = {
	  fg = "#b8cdcb";
	  bg = "#354043";
	};

	progress_error = {
	  fg = "#c79a8b";
	  bg = "#354043";
	};

	perm_type = {
	  fg = "#b8cdcb";
	};

	perm_read = {
	  fg = "#969a8f";
	};

	perm_write = {
	  fg = "#c9c0a7";
	};

	perm_exec = {
	  fg = "#809b9b";
	};

	perm_sep = {
	  fg = "#626964";
	};
      };

      which = {
	cols = 3;

	mask = {
	  bg = "#20292d";
	};

	cand = {
	  fg = "#b8cdcb";
	};

	rest = {
	  fg = "#626964";
	};

	desc = {
	  fg = "#c9c0a7";
	};

	separator = "  ";

	separator_style = {
	  fg = "#404847";
	};
      };

      confirm = {
	border = {
	  fg = "#809b9b";
	};

	title = {
	  fg = "#c9c0a7";
	  bold = true;
	};

	content = {
	  fg = "#b8b8aa";
	};

	list = {
	  fg = "#969a8f";
	};

	btn_yes = {
	  fg = "#20292d";
	  bg = "#b8cdcb";
	  bold = true;
	};

	btn_no = {
	  fg = "#20292d";
	  bg = "#969a8f";
	};

	btn_labels = [ "  Yes  " "  No  " ];
      };

      spot = {
	border = {
	  fg = "#809b9b";
	};

	title = {
	  fg = "#c9c0a7";
	  bold = true;
	};

	tbl_col = {
	  fg = "#969a8f";
	};

	tbl_cell = {
	  fg = "#c9c0a7";
	};
      };

      notify = {
	title_info = {
	  fg = "#b8cdcb";
	};

	title_warn = {
	  fg = "#c9c0a7";
	};

	title_error = {
	  fg = "#c79a8b";
	};
      };

      pick = {
	border = {
	  fg = "#809b9b";
	};

	active = {
	  fg = "#b8cdcb";
	  bold = true;
	};

	inactive = {
	  fg = "#969a8f";
	};
      };

      input = {
	border = {
	  fg = "#809b9b";
	};

	title = {
	  fg = "#c9c0a7";
	};

	value = {
	  fg = "#d9d2ba";
	};

	selected = {
	  reversed = true;
	};
      };

      cmp = {
	border = {
	  fg = "#809b9b";
	};

	active = {
	  fg = "#20292d";
	  bg = "#b8cdcb";
	};

	inactive = {
	  fg = "#969a8f";
	};

	icon_file = "";
	icon_folder = "";
	icon_command = "";
      };

      tasks = {
	border = {
	  fg = "#809b9b";
	};

	title = {
	  fg = "#c9c0a7";
	};

	hovered = {
	  fg = "#20292d";
	  bg = "#969a8f";
	};
      };

      help = {
	on = {
	  fg = "#b8cdcb";
	};

	run = {
	  fg = "#c9c0a7";
	};

	desc = {
	  fg = "#969a8f";
	};

	hovered = {
	  fg = "#20292d";
	  bg = "#b8cdcb";
	  bold = true;
	};

	footer = {
	  fg = "#626964";
	  bg = "#252e31";
	};
      };

      filetype = {
	rules = [
	  # Images — icy highlight
	  {
	    mime = "image/*";
	    fg = "#b8cdcb";
	  }

	  # Video / audio — muted frost
	  {
	    mime = "{audio,video}/*";
	    fg = "#a8b8b5";
	  }

	  # Archives
	  {
	    mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd}";
	    fg = "#c9c0a7";
	  }

	  # Documents
	  {
	    mime = "application/{pdf,doc,rtf}";
	    fg = "#b8b8aa";
	  }

	  # Empty files
	  {
	    mime = "inode/empty";
	    fg = "#626964";
	  }

	  # Broken symlinks
	  {
	    url = "*";
	    is = "orphan";
	    fg = "#c79a8b";
	  }

	  # Executables
	  {
	    url = "*";
	    is = "exec";
	    fg = "#9eb6b3";
	  }

	  # Directories
	  {
	    url = "*/";
	    fg = "#b8cdcb";
	    bold = true;
	  }

	  # Normal files
	  {
	    url = "*";
	    fg = "#c9c0a7";
	  }
	];
      };
    };
  };

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };
    };
  };

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
      confirm_os_window_close = "0";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  fonts.fontconfig.enable = true;

  home.username = "bagii";
  home.homeDirectory = "/home/bagii";
  home.stateVersion = "26.05";

  home.sessionVariables = {
    USE_LAYER_SHELL = "1";
    UV_PYTHON_DOWNLOADS = "never";
  };

  home.packages = with pkgs; [
    kdePackages.kate
    uv
    python313
  ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "bagii";
        email = "you@example.com";
      };
    };
  };

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
