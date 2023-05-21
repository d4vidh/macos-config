{ vimPlugins }:

{
  enable = true;

  extraConfig = (builtins.readFile ../config/.vimrc);

  plugins = with vimPlugins; [
    ctrlp
    editorconfig-vim
    gruvbox
    nerdtree
    tabular
    vim-nix
  ];

  vimAlias = true;
}
