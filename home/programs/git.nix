{ pkgs }:

{
  enable = true;
  package = pkgs.gitAndTools.gitFull;
  aliases = (import ../aliases.nix { inherit pkgs; }).git;

  delta.enable = true;

  extraConfig = {
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };

    commit.gpgsign = "true";
    gpg.program = "gpg2";

    protocol.keybase.allow = "always";
    credential.helper = "osxkeychain";
    pull.rebase = "false";
    init.defaultBranch = "main";

    user = { signingkey = "0x42990D8D3801D085"; };
  };

  ignores = [ ".cache/" ".DS_Store" ".direnv/" ".idea/" "*.swp" ".vscode/" ];

  lfs.enable = true;

  userEmail = "daeyoungh923@gmail.com";
  userName = "Daeyoung Hong";
}
