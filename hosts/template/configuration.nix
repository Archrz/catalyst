{ ... }:
{
  imports = [
    # Home
    ../../home
    ../../home/arch/mango
    ../../home/arch/gui.nix

    # Disk
    ./disko.nix
    ./hardware.nix

    # Drivers
    ../../common/drivers/amd-gpu.nix
    ../../common/drivers/amd-cpu.nix

    # NixOS
    ../../common/nixpkgs.nix

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
}
