{ ... }:
{
  services.flatpak = {
    packages = [
      "com.teamspeak.TeamSpeak3"
      "org.signal.Signal"
      "im.riot.Riot" # Element Client (Matrix)
      "dev.vencord.Vesktop" # Discord
    ];

    overrides = {
      "org.signal.Signal" = {
        Environment = {
          SIGNAL_PASSWORD_STORE = "kwallet6"; # Use KDE Wallet for password storage
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
