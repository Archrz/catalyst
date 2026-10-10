{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Steam's bundled libaudio.so segfaults
  services.pipewire.extraConfig.pipewire-pulse."99-steam-libaudio-quirk" = {
    "pulse.rules" = [
      {
        matches = [ { "application.process.binary" = "steam"; } ];
        actions.quirks = [ "force-s16-info" ];
      }
    ];
  };
}
