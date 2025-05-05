{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    protontricks
    protonup-qt
    vkBasalt
    gamescope

    # Epic Games and GOG launcher
    heroic
  ];

  # Vulkan and OpenGL monitoring
  programs.mangohud = {
    #enable = true;
    #enableSessionWide = true;
  };

  services.flatpak = {
    packages = [
      "org.prismlauncher.PrismLauncher"
      "com.usebottles.bottles"
    ];

    overrides = {
      "org.prismlauncher.PrismLauncher".Context = {
        filesystems = [
          "/mnt/Games3/Minecraft/PrismLauncher/instances:rw"
          "/mnt/Games3/Minecraft/PrismLauncher/mods:rw"
          "/mnt/Games3/Minecraft/PrismLauncher/icons:rw"
        ];
      };
      "com.usebottles.bottles".Context = {
        filesystems = [
          "/mnt/Games1:rw"
          "/mnt/Games3:rw"
        ];
      };
    };
  };
}
