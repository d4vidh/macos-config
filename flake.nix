{
  description = "My nix configuration";

  inputs = {
    # packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv/latest";

    # system management
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # shell
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs@{ self, nixpkgs, devenv, darwin, home-manager, ... }:
    let
      system = "aarch64-darwin";

      pkgs = import nixpkgs { inherit system; };

      mkDarwinConfiguration = { system, pkgs, hostName, extraModules ? [ ] }:
        darwin.lib.darwinSystem {
          inherit system;
          specialArgs = { inherit self inputs nixpkgs hostName; };
          modules = [
            self.darwinModules.base
            self.darwinModules.brew
            home-manager.darwinModules.home-manager
            ./home
          ] ++ extraModules;
        };
    in {
      devShell."${system}" = devenv.lib.mkShell {
        inherit inputs pkgs;
        modules = [ (import ./devenv.nix) ];
      };

      darwinConfigurations = {
        "david-work-macbook" = mkDarwinConfiguration {
          inherit system pkgs;
          hostName = "david-work-macbook";
          extraModules = [ ./darwin/hosts/david-work-macbook.nix ];
        };
      };

      darwinModules = {
        base = { pkgs, ... }: import ./darwin/base { inherit pkgs; };
        brew = import ./darwin/brew { };
      };
    };
}
