{ inputs, pkgs, ... }:
let
  theme = pkgs.runCommand "spicetify-default-ayu" { } ''
    cp -r "${inputs.spicetify-themes}/Default" $out
    chmod -R u+w $out
    
cp ${pkgs.writeText "color.ini" ''
      [AyuOLED]
      text = E6E1CF
      subtext = E6E1CF
      main = 000000
      sidebar = 000000
      player = 000000
      card = 0D0D0D
      shadow = 000000
      selected-row = E6E1CF
      button = FFB454
      button-active = FFB454
      button-disabled = 2D3640
      tab-active = FFB454
      notification = FFB454
      notification-error = F07178
      misc = E6E1CF
      highlight = 000000
      highlight-elevated = 0D0D0D
      sidebar_indicator_and_hover_button_bg = E6E1CF
    ''} $out/color.ini
  '';
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spicetify = {
    enable = true;
    theme = { name = "Default"; src = theme; };
    colorScheme = "AyuOLED";
  };
}
