{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ protonmail-bridge ];

  systemd.user.services."protonmail-bridge" = {
    Unit = {
      Description = "ProtonMail Bridge";
    };

    Service = {
      Type = "simple";
      Restart = "always";
      RestartSec = 10;
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
