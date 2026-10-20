{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sops
    age
    claude-code
    obsidian
    blender
    qt6.qtdeclarative
    scanmem
    dotnet-sdk_10
  ];
}
