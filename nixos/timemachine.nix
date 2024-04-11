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
            nssmdns = true;
            openFirewall = true;
            publish = {
                enable = true;
                userServices = true;
            };
        };
    };
    services.nscd.enableNsncd = true;
}