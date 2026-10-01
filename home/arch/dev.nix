{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    stylua
    shfmt
    prettier
    taplo
    nixfmt
    python3
    go
    ruff
    uv
    nodejs
    rustc
    cargo
    rustfmt
    ghidra
  ];
}
