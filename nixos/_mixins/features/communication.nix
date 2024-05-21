{ pkgs, ... }: {
  services.flatpak.packages = [
    "dev.vencord.Vesktop"
    "com.teamspeak.TeamSpeak"
    "org.signal.Signal"
    "im.riot.Riot"
  ];
}
