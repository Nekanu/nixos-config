{ pkgs, username, ... }:
{
  home.packages = with pkgs.unstable; [
    tor-browser-bundle-bin
    libreoffice
    keepassxc
    pcloud
  ];

  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.pcloud}/share/applications/pcloud.desktop"
      "${pkgs.keepassxc}/share/applications/keepassxc.desktop"
    ];
  };

  programs.obsidian = {
    enable = true;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  services.flatpak = {
    packages = [
      "com.vivaldi.Vivaldi" # Web browser
      {
        appId = "org.mozilla.Thunderbird";
        origin = "flathub-beta";
      } # Email client (Beta due to Tray support)
      # "com.ulduzsoft.Birdtray" # Thunderbird tray icon
      #"org.keepassxc.KeePassXC" # Password manager
      "com.usebottles.bottles" # Wine compatibility layer
      "com.logseq.Logseq" # Note-taking app
      "org.onlyoffice.desktopeditors" # Office suite
      "me.proton.Mail"
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
          "/mnt/Data1:rw" # Allow access to Data1 disk
        ];
      };
    };
  };
}
