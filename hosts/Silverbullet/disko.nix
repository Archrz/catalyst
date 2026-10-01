{ inputs, ... }:
let
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

  services.udev.extraRules = ''
    ENV{ID_SERIAL}=="KINGSTON_SFYRS1000G_50026B76862AB15C_1", ENV{UDISKS_IGNORE}="1"
    ENV{ID_SERIAL}=="KINGSTON_SFYRD2000G_50026B76862B3327_1", ENV{UDISKS_IGNORE}="1"
    ENV{DM_NAME}=="games-1tb", ENV{UDISKS_IGNORE}="1"
  '';

  disko.devices.disk = {
    games1tb = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-KINGSTON_SFYRS1000G_50026B76862AB15C";
      content = luks "games-1tb" null;
    };

    games2tb = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-KINGSTON_SFYRD2000G_50026B76862B3327";
      content = luks "games-2tb" {
        type = "btrfs";
        extraArgs = [
          "-L"
          "gamespool"
          "-d"
          "raid0"
          "/dev/mapper/games-1tb"
        ];
        subvolumes."/" = {
          mountpoint = "/mnt/games";
          mountOptions = [
            "noatime"
            "compress=zstd"
            "discard=async"
            "nofail"
            "x-systemd.device-timeout=120"
          ];
        };
      };
    };

    system = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_500GB_S4EVNF0M325634K";
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
