{ config, pkgs, ... }:
{
  services.flatpak = {
    packages = [
      "com.teamspeak.TeamSpeak3"
      "org.signal.Signal"
      "im.riot.Riot"
      "dev.vencord.Vesktop"
    ];

    overrides = {
      "org.signal.Signal" = {
        Environment = {
          SIGNAL_PASSWORD_STORE = "kwallet6";
        };

        Context = {
          filesystems = [
            "!host"
            "xdg-download:rw"
          ];
        };
      };
    };
  };
}
