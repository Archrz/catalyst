{ inputs, ... }:
let
  # Set your disk: ls -l /dev/disk/by-id/
  luks =
    name: content:
    {
      type = "luks";
      inherit name content;
      settings = {
        allowDiscards = true;
        crypttabExtraOpts = [ "tpm2-device=auto" ];
      };
    };
in
{
  imports = [ inputs.disko.nixosModules.disko ];

  disko.devices.disk = {
    system = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-REPLACE_WITH_YOUR_DISK";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "fmask=0077"
                "dmask=0077"
              ];
            };
          };
          root = {
            size = "100%";
            content = luks "root" {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
