{ pkgs, ... }:
{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    ffmpegthumbnailer
    file-roller
    libnotify
    localsend
    pavucontrol
    plexamp
  ];
}
