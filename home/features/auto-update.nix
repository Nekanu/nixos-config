{
  config-repository,
  pkgs,
  username,
  ...
}:
{
  systemd.user.timers."home-manager-upgrade" = {
    Unit.Description = "Upgrade home-manager";

    Install.WantedBy = [ "timers.target" ];

    Timer = {
      OnCalendar = "*-*-* 02:30:00";
      Persistent = true;
      Unit = "home-manager-upgrade.service";
    };

  };

  systemd.user.services."home-manager-upgrade" = {
    Unit.Description = "Upgrade home-manager";

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.home-manager}/bin/home-manager switch -b backup --flake ${config-repository}#${username}";
    };
  };
}
