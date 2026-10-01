{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraCss = ''
      /* ============================================================
         Nemo — frosty / wallpaper-matched glass
         ============================================================ */

      @define-color nemo_base #20292d;
      @define-color nemo_surface #252e31;
      @define-color nemo_surface_raised #2e3638;
      @define-color nemo_surface_light #404847;

      @define-color nemo_text #c9c0a7;
      @define-color nemo_text_bright #e1dac7;
      @define-color nemo_muted #969a8f;

      @define-color nemo_selection rgba(201, 192, 167, 0.16);
      @define-color nemo_selection_hover rgba(201, 192, 167, 0.09);
      @define-color nemo_border rgba(201, 192, 167, 0.10);


      /* ------------------------------------------------------------
         Main window
         ------------------------------------------------------------ */

      .nemo-window {
        background-color: rgba(32, 41, 45, 0.82);
        color: @nemo_text;
      }

      .nemo-window.background {
        background-color: rgba(32, 41, 45, 0.82);
      }


      /* ------------------------------------------------------------
         Toolbar / navigation
         ------------------------------------------------------------ */

      .nemo-window toolbar {
        background-color: rgba(37, 46, 49, 0.78);
        color: @nemo_text;

        border: none;
        border-bottom: 1px solid @nemo_border;

        padding: 4px 6px;
      }

      .nemo-window toolbar button {
        background-color: transparent;
        color: @nemo_muted;

        border: 1px solid transparent;
        border-radius: 8px;

        box-shadow: none;
      }

      .nemo-window toolbar button:hover {
        background-color: rgba(201, 192, 167, 0.08);
        color: @nemo_text_bright;
      }

      .nemo-window toolbar button:checked,
      .nemo-window toolbar button:active {
        background-color: rgba(201, 192, 167, 0.13);
        color: @nemo_text_bright;

        border-color: rgba(201, 192, 167, 0.10);
      }


      /* ------------------------------------------------------------
         Breadcrumb / path buttons
         ------------------------------------------------------------ */

      .nemo-window .linked button {
        background-color: rgba(64, 72, 71, 0.26);

        color: @nemo_text;

        border-color: rgba(201, 192, 167, 0.06);
        border-radius: 7px;
      }

      .nemo-window .linked button:hover {
        background-color: rgba(201, 192, 167, 0.10);
      }

      .nemo-window .linked button:checked,
      .nemo-window .linked button:active {
        background-color: rgba(201, 192, 167, 0.16);
        color: @nemo_text_bright;
      }


      /* ------------------------------------------------------------
         Sidebar
         ------------------------------------------------------------ */

      .nemo-window .nemo-places-sidebar,
      .nemo-window .nemo-places-sidebar viewport {
        background-color: rgba(37, 46, 49, 0.70);
        color: @nemo_text;
      }

      .nemo-window .nemo-places-sidebar {
        border-right: 1px solid @nemo_border;
      }

      .nemo-window .nemo-places-sidebar row {
        background-color: transparent;

        border-radius: 7px;

        color: @nemo_text;
      }

      .nemo-window .nemo-places-sidebar row:hover {
        background-color: @nemo_selection_hover;
      }

      .nemo-window .nemo-places-sidebar row:selected {
        background-color: @nemo_selection;
        color: @nemo_text_bright;
      }


      /* ------------------------------------------------------------
         Main file view
         ------------------------------------------------------------ */

      .nemo-window treeview.view,
      .nemo-window iconview.view,
      .nemo-window .view {
        background-color: rgba(32, 41, 45, 0.72);

        color: @nemo_text;
      }

      .nemo-window treeview.view:selected,
      .nemo-window iconview.view:selected,
      .nemo-window .view:selected {
        background-color: @nemo_selection;

        color: @nemo_text_bright;
      }

      .nemo-window treeview.view:hover {
        background-color: rgba(201, 192, 167, 0.05);
      }


      /* Column headers */
      .nemo-window treeview header button {
        background-color: rgba(37, 46, 49, 0.64);

        color: @nemo_muted;

        border: none;
        border-bottom: 1px solid @nemo_border;

        box-shadow: none;
      }

      .nemo-window treeview header button:hover {
        color: @nemo_text;
        background-color: rgba(201, 192, 167, 0.06);
      }


      /* ------------------------------------------------------------
         Inputs / search
         ------------------------------------------------------------ */

      .nemo-window entry {
        background-color: rgba(32, 41, 45, 0.74);

        color: @nemo_text_bright;

        border: 1px solid rgba(201, 192, 167, 0.10);
        border-radius: 8px;

        box-shadow: none;
      }

      .nemo-window entry:focus {
        border-color: rgba(201, 192, 167, 0.28);

        box-shadow:
          0 0 0 1px rgba(201, 192, 167, 0.08);
      }


      /* ------------------------------------------------------------
         Menus
         ------------------------------------------------------------ */

      .nemo-window menu,
      .nemo-window .menu {
        background-color: rgba(37, 46, 49, 0.96);

        color: @nemo_text;

        border: 1px solid @nemo_border;
        border-radius: 9px;
      }

      .nemo-window menuitem {
        color: @nemo_text;
      }

      .nemo-window menuitem:hover {
        background-color: @nemo_selection;

        color: @nemo_text_bright;
      }


  /* ------------------------------------------------------------
    Bottom status / control bar
  ------------------------------------------------------------ */

      .nemo-window statusbar,
      .nemo-window statusbar > *,
      .nemo-window statusbar box,
      .nemo-window statusbar frame,
      .nemo-window statusbar button,
      .nemo-window statusbar scale {
	background-color: transparent;
	background-image: none;

	box-shadow: none;
	border-color: transparent;
      }

      /* One continuous glass surface */
      .nemo-window statusbar {
	background-color: rgba(37, 46, 49, 0.72);

	color: @nemo_muted;

	border-top: 1px solid @nemo_border;
      }

      /* Bottom-left buttons */
      .nemo-window statusbar button {
	border-radius: 7px;

	color: @nemo_muted;
      }

      .nemo-window statusbar button:hover {
	background-color: rgba(201, 192, 167, 0.08);
	color: @nemo_text_bright;
      }

      /* Zoom slider */
      .nemo-window statusbar scale trough {
	background-color: rgba(32, 41, 45, 0.42);

	border: none;
	border-radius: 999px;
      }

      .nemo-window statusbar scale slider {
	background-color: @nemo_text;

	border: none;
	border-radius: 999px;

	box-shadow: none;
      }

      /* ------------------------------------------------------------
         Scrollbars
         ------------------------------------------------------------ */

      .nemo-window scrollbar {
        background-color: transparent;
      }

      .nemo-window scrollbar slider {
        background-color: rgba(150, 154, 143, 0.40);

        border: none;
        border-radius: 999px;

        min-width: 6px;
        min-height: 6px;
      }

      .nemo-window scrollbar slider:hover {
        background-color: rgba(201, 192, 167, 0.54);
      }


      /* ------------------------------------------------------------
         Separators
         ------------------------------------------------------------ */

      .nemo-window separator {
        background-color: @nemo_border;

        min-width: 1px;
        min-height: 1px;
      }
    '';
  };


  /* ==============================================================
     Nemo behaviour / layout
     ============================================================== */

  dconf.settings = {
    "org/nemo/window-state" = {
      # The old File/Edit/View/etc. bar is the biggest visual giveaway
      # that Nemo is an older GTK application.
      "start-with-menu-bar" = false;

      "start-with-toolbar" = true;
      "start-with-location-bar" = true;
      "start-with-sidebar" = true;

      # Keep this for now. We can remove it later if you want an even
      # cleaner look.
      "start-with-status-bar" = true;

      "sidebar-width" = 190;
    };
  };


  /* ==============================================================
     Default file manager
     ============================================================== */

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-gnome-saved-search" = [ "nemo.desktop" ];
    };
  };
}
