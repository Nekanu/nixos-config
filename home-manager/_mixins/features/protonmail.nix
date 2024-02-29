{ config, pkgs, username, ... }:
{
  home.packages = with pkgs; [
    protonmail-bridge
  ];

  systemd.user.services."protonmail-bridge" = {
    Unit = {
      Description = "ProtonMail Bridge";

      Wants = [ "network-online.target" "multi-user.target" ];
      After = [ "network-online.target" "multi-user.target" ];
    };

    Service = {
      Type = "simple";
      Restart = "on-failure";
      RestartSec = 10;
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive";
    };
  };
}