{ ... }:

{
  homebrew = {
    enable = true;
    brews = [ "mas" ];
    casks = [
      "1password"
      "dash"
      "figma"
      "fork"
      "microsoft-edge"
      "microsoft-teams"
      "notion"
      "raycast"
      "readdle-spark"
      "visual-studio-code"
      "warp"
    ];

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
  };
}
