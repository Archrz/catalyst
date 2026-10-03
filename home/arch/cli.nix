{ pkgs, inputs, ... }:
{
  imports = [
    ./hm/git.nix
    ./hm/fish.nix
    ./hm/zoxide.nix

    inputs.catalyst-nvim.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    bat
    btop
    killall
    duf
    dysk
    gh
    gum
    imagemagick
    jq
    ncdu
    ncmpcpp
    ripgrep
    wget

    # SRE / IaC
    ansible
    fluxcd
    k9s
    kubectl
    kubernetes-helm
    kustomize
    openstackclient
    opentofu
    talosctl
  ];
}
