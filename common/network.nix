{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ethtool
    networkmanagerapplet
  ];
}
