{ config, pkgs, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.nekanu = {
    description = "Nekanu";
    extraGroups =
      [
        "networkmanager"
        "wheel"
      ]
      ++ ifExists [
        "audio"
        "video"
        "nordvpn" # NordVPN
        "gaming" # Access to gaming disks
      ];
    # mkpasswd -m sha-512
    initialHashedPassword = "$y$j9T$ENNuzed4KTBwkim/kZdz.1$F2B.I7CWGmZOYYWBhTdHz8TmbyON7ZshktYD8/pqPE/";
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
