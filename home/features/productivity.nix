{ pkgs, username, ... }:
{
  home.packages = with pkgs.unstable; [
    tor-browser-bundle-bin
    libreoffice
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  services.flatpak = {
    packages = [
      "com.vivaldi.Vivaldi" # Web browser
      "org.mozilla.Thunderbird" # Email client
      # "com.ulduzsoft.Birdtray" # Thunderbird tray icon
      "org.keepassxc.KeePassXC" # Password manager
      "com.usebottles.bottles" # Wine compatibility layer
      "com.logseq.Logseq" # Note-taking app
      "org.onlyoffice.desktopeditors" # Office suite
    ];

    overrides = {
      "org.keepassxc.KeePassXC".Context = {
        filesystems = [
          "~/.mozilla/native-messaging-hosts:rw" # Required for KeePassXC browser integration with Firefox
        ];
      };

      "com.usebottles.bottles".Context = {
        filesystems = [
          "home:rw" # Allow access to home directory
          "/run/media/${username}:rw" # Allow access to removable media
        ];
      };
    };
  };
}
