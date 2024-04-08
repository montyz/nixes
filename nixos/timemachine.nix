{ self, config, lib, pkgs, ... }: {
    networking.firewall.allowedTCPPorts = [
    548 # netatalk
    636
    ];

    services = {
        netatalk = {
            enable = true;

            volumes = {
            "monty-time-machine" = {
                "time machine" = "yes";
                path = "/home/monty/time-machine";
                "valid users" = "monty";
            };
            };
        };

        avahi = {
            enable = true;
            nssmdns = false;

            publish = {
                enable = true;
                userServices = true;
            };
        };
    };
    # this is what avahi.nssmdns does, but mdns4 (IPv4) instead of mdns (dual-stack)
    system.nssModules = pkgs.lib.optional true pkgs.nssmdns;
    system.nssDatabases.hosts = pkgs.lib.optionals true (pkgs.lib.mkMerge [
        (pkgs.lib.mkBefore [ "mdns4_minimal [NOTFOUND=return]" ]) # before resolve
        (pkgs.lib.mkAfter [ "mdns4" ]) # after dns
    ]);
}