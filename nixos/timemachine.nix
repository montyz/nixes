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
            openFirewall = true;
            publish = {
                enable = true;
                userServices = true;
                addresses = true;
            };
        };
    };
    system.nssModules = with pkgs.lib; optional (!config.services.avahi.nssmdns) pkgs.nssmdns;
    system.nssDatabases.hosts = with pkgs.lib; optionals (!config.services.avahi.nssmdns) (mkMerge [
      (mkOrder 900 [ "mdns4_minimal [NOTFOUND=return]" ]) # must be before resolve
      (mkOrder 1501 [ "mdns4" ]) # 1501 to ensure it's after dns
    ]);
    #services.nscd.enableNsncd = true;
}