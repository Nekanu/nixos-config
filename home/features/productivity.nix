{ pkgs, username, ... }: {

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  services.flatpak = { 
    packages = [
      "com.brave.Browser"
      "org.mozilla.Thunderbird"
      "com.ulduzsoft.Birdtray"
      "org.remmina.Remmina"
      "org.keepassxc.KeePassXC"
      "com.usebottles.bottles"
      "com.logseq.Logseq"
      "io.github.aandrew_me.ytdn"
      "org.onlyoffice.desktopeditors"
      "org.libreoffice.LibreOffice"
    ];

    overrides = {
      "org.keepassxc.KeePassXC".Context = {
        filesystems = [
          "~/.mozilla/native-messaging-hosts:rw" # Required for KeePassXC browser integration with Firefox
        ];
      };

      "com.usebottles.bottles".Context = {
        filesystems = [
          "/run/media/${username}:rw"
        ];
      };
    };
  };
}
