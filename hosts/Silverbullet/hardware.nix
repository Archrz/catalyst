# Kernel modules and firmware
{ lib, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [
    "vmd"
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];

  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [
    "snd_usb_audio.quirks=0x19f7:0x000a=0x80"
    "usbcore.autosuspend=-1"
  ];

  boot.kernel.sysctl."vm.max_map_count" = 2147483642;
  boot.extraModprobeConfig = "options hid_apple fnmode=2";

  boot.initrd.supportedFilesystems = [ "btrfs" ];
  boot.initrd.systemd.tpm2.enable = true;
  security.tpm2.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
