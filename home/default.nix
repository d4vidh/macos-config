{ pkgs, ... }:

let username = "david";
in {
  nixpkgs = import ./nixpkgs.nix;

  home-manager = {
    extraSpecialArgs = { inherit username; };
    users.${username} = { home.stateVersion = "22.11"; };
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
