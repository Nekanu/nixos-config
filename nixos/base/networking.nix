{ hostid, hostname, ... }:
{
  # Use passed in hostid and hostname to configure basic networking
  networking = {
    hostName = hostname;
    hostId = hostid;

    networkmanager.enable = true;
    firewall.enable = true;
    nftables.enable = true;
  };

  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
