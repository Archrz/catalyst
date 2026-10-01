{ inputs, ... }:
{
  imports = [
    # Home
    ../../home
    ../../home/arch/mango

    # Disk
    ./disko.nix
    ./hardware.nix

    # Drivers
    ../../common/drivers/amd-gpu.nix
    ../../common/drivers/amd-cpu.nix

    # NixOS
    ../../common/nixpkgs.nix

    inputs.catalyst-shell.nixosModules.sddm

    # Common
    ../../common/boot.nix
    ../../common/core.nix
    ../../common/fonts.nix
    ../../common/services.nix
    ../../common/network.nix
    ../../common/desktop.nix
  ];

  home-manager.users.arch.xdg.configFile = {
    "mango/extra.conf".source = ./mango/extra.conf;
  };

  networking = {
    hostName = "template";
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
  };

  services.displayManager.sddm.enable = true;
}
