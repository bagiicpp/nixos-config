{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    USE_LAYER_SHELL = "1";
    UV_PYTHON_DOWNLOADS = "never";
  };

  home.pointerCursor = {
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

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
}
