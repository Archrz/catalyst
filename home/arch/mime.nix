{ lib, username, ... }:
let
  zen = "zen-beta.desktop";
  nvim = "nvim.desktop";
  feh = "feh.desktop";
  mpv = "mpv.desktop";
  okular = "okularApplication_pdf.desktop";
  defaults = app: types: lib.genAttrs types (_: app);
in
{
  home-manager.users.${username} = {
    xdg = {
      desktopEntries.nvim = {
        name = "Neovim";
        exec = "ghostty -e nvim %F";
        icon = "nvim";
      };

      mimeApps = {
        enable = true;
        defaultApplications =
          defaults zen [
            "text/html"
            "x-scheme-handler/http"
            "x-scheme-handler/https"
            "x-scheme-handler/about"
            "application/x-extension-htm"
            "application/x-extension-html"
            "application/x-extension-shtml"
            "application/xhtml+xml"
            "application/x-extension-xhtml"
            "application/x-extension-xht"
          ]
          // defaults okular [
            "application/pdf"
          ]
          // defaults nvim [
            "text/plain"
            "text/markdown"
            "text/x-markdown"
          ]
          // defaults feh [
            "image/jpeg"
            "image/png"
            "image/gif"
            "image/webp"
            "image/tiff"
            "image/bmp"
          ]
          // defaults mpv [
            "audio/mpeg"
            "audio/mp3"
          ];
      };
    };
  };
}
