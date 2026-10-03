{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    mutableUserSettings = false;
    mutableUserKeymaps = false;

    extraPackages = with pkgs; [
      nil
      rust-analyzer
      pyright
    ];

    themes.Catalyst = ./catalyst-theme.json;

    extensions = [
      # Themes
      "material-icon-theme"

      # Languages
      "nix"
      "toml"
      "svelte"
      "html"
      "qml"
      "basher"
      "typst"
      "git-firefly"
      "astro"
      "terraform"
      "lua"
      "xml"

      # SRE
      "ansible"
      "dockerfile"
      "docker-compose"
      "helm"
      "opentofu"

      # Diagrams
      "mermaid"
    ];

    userSettings = {
      vim_mode = true;
      base_keymap = "VSCode";
      disable_ai = true;
      auto_update = false;

      theme = {
        mode = "dark";
        dark = "Catalyst";
      };
      icon_theme = "Material Icon Theme";

      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_fallbacks = [
        "Consolas"
        "monospace"
      ];
      buffer_font_size = 15;
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 15;
      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        font_fallbacks = [
          "Consolas"
          "monospace"
        ];
      };

      relative_line_numbers = "enabled";
      vertical_scroll_margin = 8;
      scroll_beyond_last_line = "off";
      current_line_highlight = "line";
      cursor_blink = false;
      show_whitespaces = "all";
      soft_wrap = "none";
      sticky_scroll.enabled = false;
      tab_size = 4;

      autosave = "off";
      format_on_save = "on";
      auto_indent_on_paste = true;
      use_on_type_format = true;
      ensure_final_newline_on_save = true;
      remove_trailing_whitespace_on_save = true;

      project_panel = {
        dock = "left";
        default_width = 260;
      };
      outline_panel.dock = "left";
      title_bar = {
        show_sign_in = false;
        show_user_picture = false;
        show_user_menu = false;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      languages = {
        Nix = {
          language_servers = [ "nil" ];
          formatter.external.command = "nixfmt";
        };
        Python = {
          language_servers = [
            "pyright"
            "ruff"
          ];
          formatter.language_server.name = "ruff";
        };
      };
    };

    userKeymaps = [
      {
        context = "Editor";
        bindings = {
          "ctrl-s" = "workspace::Save";
        };
      }
      {
        context = "VimControl && !menu";
        bindings = {
          "space e" = "project_panel::ToggleFocus";
          "space f f" = "file_finder::Toggle";
          "space f g" = "pane::DeploySearch";
          "space f b" = "tab_switcher::Toggle";
          "space f r" = "projects::OpenRecent";
          "space w" = "workspace::Save";
          "space q" = "pane::CloseActiveItem";
          "space b d" = "pane::CloseActiveItem";
          "space c a" = "editor::ToggleCodeActions";
          "space r n" = "editor::Rename";
          "shift-l" = "pane::ActivateNextItem";
          "shift-h" = "pane::ActivatePreviousItem";
          "ctrl-h" = [
            "workspace::ActivatePaneInDirection"
            "Left"
          ];
          "ctrl-j" = [
            "workspace::ActivatePaneInDirection"
            "Down"
          ];
          "ctrl-k" = [
            "workspace::ActivatePaneInDirection"
            "Up"
          ];
          "ctrl-l" = [
            "workspace::ActivatePaneInDirection"
            "Right"
          ];
        };
      }
      {
        context = "vim_mode == visual";
        bindings = {
          "shift-j" = "editor::MoveLineDown";
          "shift-k" = "editor::MoveLineUp";
        };
      }
    ];
  };
}
