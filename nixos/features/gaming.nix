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

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;


  environment.systemPackages = with pkgs.unstable; [
    protontricks
    vkBasalt
    protonup-qt
    mangohud
    steamtinkerlaunch # Modding

    heroic # Epic Games Store

    # Minecraft
    temurin-jre-bin-8 # - 1.16.5
    temurin-jre-bin-17 # 1.17 +
  ];

  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
      # com.valvesoftware.Steam \
      # com.valvesoftware.Steam.CompatibilityTool.Boxtron \
      # com.valvesoftware.Steam.Utility.protontricks \
      # com.valvesoftware.Steam.Utility.gamescope \
      # org.freedesktop.Platform.VulkanLayer.MangoHud \
      # org.freedesktop.Platform.VulkanLayer.vkBasalt \
      # com.heroicgameslauncher.hgl \
  ];
}
