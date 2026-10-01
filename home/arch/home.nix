{ ... }:
{
  programs.home-manager.enable = true;

  home.sessionVariables.EDITOR = "nvim";

  home.sessionPath = [ "$HOME/.local/bin" ];

  home.file = {
    ".face.icon".source = ./wall/img/ghost_in_space.png;
    ".config/face.jpg".source = ./wall/img/ghost_in_space.png;
    ".config/gtk-3.0/bookmarks".text = "file:///mnt/games gamespool\n";
  };
}
