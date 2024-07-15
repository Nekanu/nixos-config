{ config, ... }: {
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.teamspeak.TeamSpeak3"
    "org.signal.Signal"
    "im.riot.Riot"
  ];
}