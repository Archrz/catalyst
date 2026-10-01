{
  pkgs,
  inputs,
  username,
  ...
}:
{
  imports = [ inputs.mangowm.nixosModules.mango ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  programs.mango.enable = true;

  xdg.portal.wlr.settings.screencast = {
    chooser_type = "dmenu";
    chooser_cmd = "catalyst-screenshare-chooser";
  };

  systemd.user.services.xdg-desktop-portal-wlr.serviceConfig.Environment = [
    "PATH=/etc/profiles/per-user/${username}/bin:/run/current-system/sw/bin"
  ];

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      udiskie
      wlr-randr
      bemenu
      xkill
    ];

    xdg.configFile = {
      "mango/config.conf".source = ./config.conf;
      "mango/startup.conf".source = ./startup.conf;
      "mango/keybind.conf".source = ./keybind.conf;
      "mango/mouse.conf".source = ./mouse.conf;
      "mango/layout.conf".source = ./layout.conf;
      "mango/visual.conf".source = ./visual.conf;
      "mango/window.conf".source = ./window.conf;
    };
  };
}
