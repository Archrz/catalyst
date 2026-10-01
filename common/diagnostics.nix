{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bind.dnsutils
    inxi
    lm_sensors
    lshw
    mesa-demos
    pciutils
    usbutils
  ];
}
