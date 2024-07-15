{ pkgs, ... }: {
  services.flatpak.packages = [
    "com.spotify.Client"
    "org.videolan.VLC"
    "org.blender.Blender"
    "org.gimp.GIMP"
    "org.kde.krita"
    "org.inkscape.Inkscape"
  ];
}
