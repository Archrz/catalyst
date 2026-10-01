# Aliases for fish.
host:
let
  flake = "~/catalyst#${host}";
in
{
  sv = "sudo nvim";
  v = "nvim";
  z = "zeditor";
  o = "openstack";
  ".." = "cd ..";
  c = "clear";
  fr = "sudo nixos-rebuild switch --flake ${flake}";
  fu = "nix flake update --flake ~/catalyst && sudo nixos-rebuild switch --flake ${flake}";
  fb = "nixos-rebuild build --flake ${flake}";
}
