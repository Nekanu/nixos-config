{ config, desktopEnvironments, lib, pkgs, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # Only include desktop components if one is supplied.
  imports = [
    ./packages-console.nix
  ] ++ lib.optional (desktopEnvironments != [ ]) ./packages-desktop.nix;

  users.users.nekanu = {
    description = "Nekanu";
    extraGroups = [
      "audio"
      "networkmanager"
      "users"
      "video"
      "wheel"
      "nordvpn"
    ]
    ++ ifExists [
      "docker"
      "podman"
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
}
