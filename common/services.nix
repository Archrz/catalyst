{ pkgs, username, ... }:
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
      wireplumber.enable = true;
    };

    mpd = {
      enable = true;
      user = username;
      settings = {
        music_directory = "/home/${username}/Music";
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
