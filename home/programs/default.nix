{ pkgs }:

{
  bat.enable = true;

  broot = {
    enable = true;
    enableZshIntegration = true;
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;

    nix-direnv.enable = true;
  };

  exa = {
    enable = true;
    enableAliases = true;
  };

  fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  gh = {
    enable = true;
    settings = {
      editor = "vim";
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = (import ../aliases.nix { inherit pkgs; }).gh;
    };
  };

  git = import ./git.nix { inherit pkgs; };

  gpg.enable = true;

  home-manager.enable = true;

  htop.enable = true;

  jq.enable = true;

  neovim = import ./neovim.nix { inherit (pkgs) vimPlugins; };

  nushell = import ./nushell.nix { inherit pkgs; };

  starship = import ./starship.nix;

  tmux = import ./tmux.nix;

  vscode = import ./vscode.nix { inherit pkgs; };

  zsh = import ./zsh.nix { inherit pkgs; };
}
