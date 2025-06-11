{ pkgs, username, ... }:
{
  # Steam
  programs.steam = {
    enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;

    gamescopeSession.enable = true;
    protontricks.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  users.users."${username}".extraGroups = [ "gamemode" ];

  programs.gamemode.enable = true;

  hardware.graphics.enable32Bit = true;
  services.pulseaudio.support32Bit = true;

  environment.systemPackages = with pkgs.unstable; [
    mangohud

    heroic # Epic Games Store
  ];
}
