{ hostname, config, pkgs, ... }:
{
  # Use passed in hostid and hostname to configure basic networking
  networking = {
    hostName = hostname;

    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
    };
  };

  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
