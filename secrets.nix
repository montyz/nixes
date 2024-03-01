let
  monty = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKAEof1VUD1hzvK6u6SC3/oKFqMyGKCVSiA1SXnx8RQn";
  montynix0 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPeA3INkmDWVBlb3Dy5wyue8uSLBZliZG/lU0u5e7fD/";
  users = [ monty montynix0 ];

  nix0 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMySVZTV4gULvP6UPYZrxDDuxlCO7Z6CHR2FpijrR0i";
  systems = [ nix0 ];
in
{
  "nextcloud_admin_pass.age".publicKeys = [ monty nix0 ];
  "easydns.age".publicKeys = [ monty nix0 ];
}