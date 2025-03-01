{ username, ... }:
{
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  services.flatpak = {
    packages = [
      "com.vivaldi.Vivaldi" # Web browser
      "org.mozilla.Thunderbird" # Email client
      # "com.ulduzsoft.Birdtray" # Thunderbird tray icon
      "org.remmina.Remmina" # Remote desktop client
      "org.keepassxc.KeePassXC" # Password manager
      "com.usebottles.bottles" # Wine compatibility layer
      "com.logseq.Logseq" # Note-taking app
      "io.github.aandrew_me.ytdn" # YouTube downloader
      "org.onlyoffice.desktopeditors" # Office suite
      "org.libreoffice.LibreOffice" # Office suite
    ];

    overrides = {
      "org.keepassxc.KeePassXC".Context = {
        filesystems = [
          "~/.mozilla/native-messaging-hosts:rw" # Required for KeePassXC browser integration with Firefox
        ];
      };

      "com.usebottles.bottles".Context = {
        filesystems = [
          "/run/media/${username}:rw" # Allow access to removable media
        ];
      };
    };
  };
}
