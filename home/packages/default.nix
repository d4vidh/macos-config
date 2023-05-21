{ pkgs }:

let
  darwinPkgs = (with pkgs; [ reattach-to-user-namespace ])
    ++ (with pkgs.darwin.apple_sdk.frameworks; [
      CoreServices
      Foundation
      Security
    ]);
  buildSupportPkgs = with pkgs; [ pkg-config ];
  nixPkgs = with pkgs; [ cachix nixfmt nixpkgs-fmt ];
  applicationPkgs = import ./applications.nix { inherit pkgs; };
  developmentPkgs = import ./development.nix { inherit pkgs; };
  toolPkgs = import ./tools.nix { inherit pkgs; };
in darwinPkgs ++ buildSupportPkgs ++ applicationPkgs ++ developmentPkgs
++ toolPkgs
