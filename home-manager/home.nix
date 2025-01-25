{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "monty";
  home.homeDirectory = "/home/monty";

  # This value determines the Home Manager release that your configuration is
  # want to update the value,  make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.bashInteractive
    pkgs.curl
    pkgs.eza
    pkgs.fd
    pkgs.gcal
    pkgs.jq
    pkgs.just
    pkgs.ripgrep
    pkgs.sshfs
    pkgs.tldr
    pkgs.tree
    pkgs.watch
    pkgs.wget
    pkgs.ytfzf
    pkgs.ueberzugpp
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/monty/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  # programs._1password.enable = true;
  # programs._1password-gui = {
  #   enable = true;
  #   # Certain features, including CLI integration and system authentication support,
  #   # require enabling PolKit integration on some desktop environments (e.g. Plasma).
  #   polkitPolicyOwners = [ "monty" ];
  # };
  programs.git = {    
    enable = true;
    includes = [{ path = "~/.config/home-manager/dotfiles/gitconfig"; }];
  };
    programs.bash = {
    enable = true;
    #profileExtra = builtins.readFile dotfiles/bash_profile;
    initExtra = builtins.readFile dotfiles/bashrc;
  };
    programs.fzf.enable = true;
    programs.zoxide.enable = true;
    programs.direnv = {    
      enable = true;
      nix-direnv.enable = true;
    };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.shellAliases = {
    mov0 = ''
      dir=$(find '.var/app/tv.plex.PlexDesktop/data/plex/Plex Media Server/Sync/1/1/' -path '*/\.*' -prune  -o -type d -print 2> /dev/null | fzf +m)
      rsync --progress -v -a -e 'ssh -p 2222' "$dir" server0.local:/openssh/resilio/sync/movies/
    '';
  };
}
