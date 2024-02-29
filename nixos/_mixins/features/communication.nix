{ pkgs, ... }: {
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.teamspeak.TeamSpeak"
    "org.signal.Signal"
    "im.riot.Riot"
  ];
}
