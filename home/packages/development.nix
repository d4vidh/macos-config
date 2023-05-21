{ pkgs }:

let
  nodePackages = with pkgs.nodePackages; [ pnpm ];
  pythonPackages = with pkgs.python311Packages; [ pip ];
in (with pkgs; [
  # compilers
  unison-ucm

  # interpreters
  python311

  # libraries
  ncurses
  openssl

  # tools
  dive
  just
  treefmt

  # tools/build-managers
  cmake

  # web
  nodejs-18_x
]) ++ nodePackages ++ pythonPackages
