{ config, pkgs, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.nekanu = {
    description = "Nekanu";
    extraGroups =
      [
        "audio"
        "networkmanager"
        "users"
        "video"
        "wheel"
        "nordvpn"
      ]
      ++ ifExists [
        "adbusers" # Android Debug Bridge
        "docker" # Docker
        "podman" # Podman
        "vboxusers"
        "libvirtd"
        "gaming"
      ];
    # mkpasswd -m sha-512
    initialHashedPassword = "$y$j9T$ENNuzed4KTBwkim/kZdz.1$F2B.I7CWGmZOYYWBhTdHz8TmbyON7ZshktYD8/pqPE/";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [ ];
    packages = [ pkgs.home-manager ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
