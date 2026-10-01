{ variables, ... }:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  time.timeZone = variables.timeZone;
  console.keyMap = variables.consoleKeyMap;
  system.stateVersion = "23.11";

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    enableRedistributableFirmware = true;
  };
}
