{
  enable = true;

  baseIndex = 1;
  clock24 = true;
  escapeTime = 0;

  extraConfig = (builtins.readFile ../config/tmux.conf);

  keyMode = "vi";
  shortcut = "b";
}
