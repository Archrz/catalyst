{
  description = "Catalyst";

  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    disko = {
      url = "github:nix-community/disko";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    # Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    # mango
    mangowm = {
      url = "github:mangowm/mango";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        scenefx.inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    # Apps
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    spicetify-themes = {
      url = "github:spicetify/spicetify-themes";
      flake = false;
    };

    # Bar + sddm
    catalyst-shell.url = "github:Archrz/catalyst-shell";

    # Neovim
    catalyst-nvim.url = "github:Archrz/catalyst-nvim";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      system = "x86_64-linux";

      # Overlays
      overlays = [
        inputs.helium.overlays.default
        (final: prev: {
          tailscale = inputs.nixpkgs-unstable.legacyPackages.${system}.tailscale;
        })
      ];

      hostVariables = hostname: import ./hosts/${hostname}/variables.nix;

      # Hosts
      mkHost =
        { hostname }:
        let
          host = hostname;
          variables = hostVariables hostname;
          username = variables.username;
        in

        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              username
              host
              variables
              ;
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                backupFileExtension = null;
                extraSpecialArgs = {
                  inherit
                    inputs
                    username
                    host
                    variables
                    ;
                };
              };
            }
            { nixpkgs.overlays = overlays; }
            ./hosts/${hostname}/configuration.nix
          ];
        };
    in
    {
      nixosConfigurations = {
        template = mkHost {
          hostname = "template";
        };

        Silverbullet = mkHost {
          hostname = "Silverbullet";
        };
      };
    };
}
