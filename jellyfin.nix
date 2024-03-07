{ self, config, lib, pkgs, ... }: {
  environment.systemPackages = [
    pkgs.jellyfin
  ];
}
