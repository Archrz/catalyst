{ pkgs, username, inputs, ... }:
{
  imports = [
    inputs.catalyst-shell.nixosModules.shell
    inputs.catalyst-shell.nixosModules.sddm
  ];

  services.displayManager.sddm.enable = true;

  home-manager.users.${username} = {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-source-clone
        obs-move-transition
        obs-composite-blur
      ];
    };

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
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

    home.packages = [
      pkgs.glib
      pkgs.feh
      pkgs.mpv
      pkgs.kdePackages.okular
      pkgs.helium
    ];
  };
}
