{ pkgs, ... }:

let username = "david";
in {
  nixpkgs = import ./nixpkgs.nix;

  home-manager = {
    extraSpecialArgs = { inherit username; };
    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
      "${username}" = { pkgs, ... }: {
        home = {
          packages = import ./packages { inherit pkgs; };
          shellAliases = (import ./aliases.nix { inherit pkgs; }).shell;
          stateVersion = "22.11";
        };
        programs = import ./programs { inherit pkgs; };
      };
    };
  };
}
