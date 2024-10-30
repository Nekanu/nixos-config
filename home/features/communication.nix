{ config, pkgs, ... }: {
  services.flatpak.packages = [
    "com.teamspeak.TeamSpeak3"
    "org.signal.Signal"
    "im.riot.Riot"
    "io.github.milkshiift.GoofCord"
  ];
}