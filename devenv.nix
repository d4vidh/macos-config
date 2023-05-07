{ self, inputs, pkgs, ... }:

{
  packages = [
    pkgs.rnix-lsp
    (inputs.treefmt-nix.lib.mkWrapper pkgs (import ./treefmt.nix))
  ];

  pre-commit = {
    hooks = {
      commitizen.enable = true;
      nixfmt.enable = true;
      shellcheck.enable = true;
      shfmt.enable = false;
    };

    settings = {
      deadnix.edit = true;
      deadnix.noLambdaArg = true;
    };
  };

  scripts = {
    build.exec = ''
      if [ "$#" -eq 0 ]; then
        echo "No arguments are given."
        exit 1
      fi

      while [ $# -gt 0 ]; do
        case $1 in
          --host)
            HOST=$2
            shift;;
          *)
            echo "build --host STRING"
            exit;;
        esac
        shift
      done

      nix build ".#darwinConfigurations.$HOST.system"
    '';

    load.exec = ''
      if [ "$#" -eq 0 ]; then
        echo "No arguments are given."
        exit 1
      fi

      while [ $# -gt 0 ]; do
        case $1 in
          --host)
            HOST = $2
            shift;;
          *)
            echo "load --host STRING"
            exit;;
        esac
        shift
      done

      ./result/sw/bin/darwin-rebuild switch --flake ".#$1"
    '';
  };
}
