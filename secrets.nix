let
  monty = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKAEof1VUD1hzvK6u6SC3/oKFqMyGKCVSiA1SXnx8RQn";
  users = [ monty ];

  nix0 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMySVZTV4gULvP6UPYZrxDDuxlCO7Z6CHR2FpijrR0i";
  systems = [ nix0 ];
in
{
  "nextcloud_admin_pass.age".publicKeys = [ monty nix0 ];
  "easydns.age".publicKeys = [ monty nix0 ];
}