{ pkgs, ... }: {
  home.username = "monty";
  home.homeDirectory = "/Users/monty";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}