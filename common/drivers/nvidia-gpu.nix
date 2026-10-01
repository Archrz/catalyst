{ config, pkgs, inputs, ... }:
{
  hardware.graphics = {
    enable32Bit = true;
  };
  
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package =
      (inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackagesFor
        config.boot.kernelPackages.kernel
      ).nvidiaPackages.latest;
  };
}
