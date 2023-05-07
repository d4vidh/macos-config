{ pkgs, ... }:

{
  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [ git ];
  };

  services = { nix-daemon.enable = true; };

  system = { stateVersion = 4; };

  users.users.david = {
    home = "/Users/david";
    shell = pkgs.zsh;
  };
}
