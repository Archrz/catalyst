{ host, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = import ./aliases.nix host;
    interactiveShellInit = ''
      set -g fish_color_command a6e3a1
      set -g fish_color_error f38ba8
    '';
    functions.fish_prompt = {
      body = ''
        set -l exit_code $status
        set -l path_color f9e2af
        set -l arrow_color fab387
        if test $exit_code -ne 0 -o (id -u) -eq 0
          set path_color f38ba8
          set arrow_color f38ba8
        end
        echo -n -s (set_color $path_color --bold) (prompt_pwd) (set_color normal)
        echo -n -s (set_color $arrow_color) '>' (set_color normal --bold) ' '
      '';
    };
  };
}
