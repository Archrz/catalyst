{ pkgs, ... }:
let
  sshBanner = pkgs.writeText "catalyst-ssh-banner" ''
    ██████  █████  ████████╗ █████  ██╗  ██╗   ██╗███████╗████████╗
   ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗██║  ╚██╗ ██╔╝██╔════╝╚══██╔══╝
   ██║     ███████║   ██║   ███████║██║   ╚████╔╝ ███████╗   ██║
   ██║     ██╔══██║   ██║   ██╔══██║██║    ╚██╔╝  ╚════██║   ██║
   ╚██████╗██║  ██║   ██║   ██║  ██║███████╗██║   ███████║   ██║
    ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝   ╚══════╝   ╚═╝
  '';
in
{
  security.pam.services.sddm.enableGnomeKeyring = true;
  security.rtkit.enable = true;

  services = {
    fstrim.enable = true;
    smartd.enable = true;
    libinput.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig."51-disable-nvidia-hdmi"."monitor.alsa.rules" = [
          {
            matches = [ { "device.name" = "alsa_card.pci-0000_01_00.1"; } ];
            actions.update-props."device.disabled" = true;
          }
        ];
      };
    };

    mpd = {
      enable = true;
      user = "arch";
      settings = {
        music_directory = "/home/arch/Music";
        audio_output = [
          {
            type = "pulse";
            name = "PipeWire";
          }
        ];
      };
    };

    openssh = {
      enable = true;
      settings = {
        Banner = "${sshBanner}";
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
