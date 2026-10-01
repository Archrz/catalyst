{ pkgs, ... }:
{
  services.tailscale = {
    enable = true;
    package = pkgs.tailscale;
    useRoutingFeatures = "both";
    openFirewall = true;
    extraUpFlags = [ "--accept-routes" ];
  };
}
