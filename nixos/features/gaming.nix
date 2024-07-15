{ config, pkgs, desktopEnvironments, ... }: {
  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
  };

  programs.gamescope = {
    enable = true;
  };

  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  environment.systemPackages = with pkgs.unstable; [
    protontricks
    vkBasalt
    mangohud

    heroic # Epic Games Store
  ];
}
