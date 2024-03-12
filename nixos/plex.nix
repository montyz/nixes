{ self, config, lib, pkgs, ... }: {
  environment.systemPackages = [
    pkgs.plex
  ];
}
