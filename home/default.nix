{
  pkgs,
  username,
  variables,
  inputs,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];

    shell = pkgs.${variables.defaultShell};
    ignoreShellProgramCheck = true;
  };

  programs.fish.enable = true;
  nix.settings.allowed-users = [ username ];

  home-manager.users.${username} = {
    imports = [
      ./${username}/home.nix
      ./${username}/cli.nix
      ./${username}/dev.nix
      ./${username}/hm
    ];

    home = {
      inherit username;
      homeDirectory = "/home/${username}";
      stateVersion = "26.05";
    };
  };
}
