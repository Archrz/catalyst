{ inputs, ... }:

{
  imports = [
    # Core
    ../../home
    ../../home/arch/mango
    ../../home/arch/gui.nix
    ../../home/arch/mime.nix

    inputs.catalyst-shell.nixosModules.shell
    inputs.catalyst-shell.nixosModules.sddm

    # Disk + Hardware
    ./disko.nix
    ./hardware.nix

    # Drivers
    ../../common/drivers/nvidia-gpu.nix
    ../../common/drivers/intel-cpu.nix

    # Common
    ../../common/boot.nix
    ../../common/core.nix
    ../../common/fonts.nix
    ../../common/services.nix
    ../../common/network.nix
    ../../common/docker.nix
    ../../common/tailscale.nix
    ../../common/desktop.nix
    ../../common/thunar.nix
    ../../common/media.nix
    ../../common/diagnostics.nix
    ../../common/packages.nix
    ../../common/steam.nix
    ../../common/libvirt.nix
  ];

  home-manager.users.arch.xdg.configFile = {
    "mango/extra.conf".source = ./mango/extra.conf;
  };

  networking = {
    hostName = "Silverbullet";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      checkReversePath = "loose";
      allowedTCPPorts = [
        22
        53317
      ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  services.displayManager.sddm.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  nixpkgs.config.allowUnfree = true;
}
