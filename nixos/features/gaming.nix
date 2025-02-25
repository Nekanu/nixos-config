{ pkgs, ... }:
{
  # Steam
  programs.steam = {
    enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
  };

  hardware.graphics.enable32Bit = true;
  services.pulseaudio.support32Bit = true;

  environment.systemPackages = with pkgs.unstable; [
    protontricks
    vkBasalt
    mangohud

    heroic # Epic Games Store
  ];
}
