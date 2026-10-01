{ inputs, lib, ... }:
let
  altTab = i: {
    id = "key_selectTab${toString i}";
    key = toString i;
    modifiers = {
      alt = true;
      accel = false;
    };
  };
in
{
  imports = [ inputs.zen-browser.homeModules.default ];

  programs.zen-browser = {
      enable = true;
      profiles.default = {
        id = 0;
        isDefault = true;
        settings = {
          "ui.systemUsesDarkMode" = true;
          "ui.key.menuAccessKeyFocuses" = false;
          "browser.theme.content.theme" = 0;
          "layout.css.prefers-color-scheme.content-override" = 0;
          "browser.tabs.allow_transparent_browser" = true;
          "zen.theme.content-element-separation" = 0;
        };
        keyboardShortcuts =
          lib.genList (n: altTab (n + 1)) 8;
      };
    };

  home.sessionVariables.MOZ_LEGACY_PROFILES = "1";
}
