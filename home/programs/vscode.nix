{ pkgs }:

{
  enable = true;

  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    justusadam.language-haskell
  ];

  userSettings = {
    "[mdx]" = { "editor.formatOnSave" = false; };
    "[nix]" = { "editor.defaultFormatter" = "b4dM4n.nixpkgs-fmt"; };
    "[toml]" = { "editor.defaultFormatter" = "bungcip.better-toml"; };
    "[txt]" = { "editor.formatOnSave" = false; };
    "editor.detectIndentation" = false;
    "editor.formatOnPaste" = false;
    "editor.formatOnSave" = true;
    "editor.insertSpaces" = true;
    "editor.rulers" = [ 80 100 ];
    "editor.tabSize" = 2;
    "search.exclude" = {
      "**/.direnv" = true;
      "**/.git" = true;
      "*.lock" = true;
    };
  };
  userTasks = { };
}

