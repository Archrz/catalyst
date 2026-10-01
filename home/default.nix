{ pkgs, username, variables, inputs, ... }:
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
      ./arch/home.nix
      ./arch/cli.nix
      ./arch/dev.nix
      ./arch/hm
      inputs.catalyst-nvim.homeManagerModules.default
    ];
    
    home = {
      inherit username;
      homeDirectory = "/home/${username}";
      stateVersion = "26.05";
    };
  };
}
