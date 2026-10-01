{ pkgs, username, ... }:
{
  users.users.${username}.extraGroups = [ "libvirtd" ];

  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    vagrant
    cdrtools
    cloud-init
    cloud-utils
  ];
}
