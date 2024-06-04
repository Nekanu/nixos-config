{ pkgs, ... }: {
  home.packages = with pkgs; [
    ytdownloader
  ];

  services.flatpak = { 
    packages = [
      "com.brave.Browser"
      "org.mozilla.Thunderbird"
      "com.ulduzsoft.Birdtray"
      "org.remmina.Remmina"
      "org.keepassxc.KeePassXC"
      "com.usebottles.bottles"
      "com.logseq.Logseq"
    ];

    overrides = {
      "org.keepassxc.KeePassXC".Context = {
        filesystems = [
          "~/.mozilla/native-messaging-hosts:rw" # Required for KeePassXC browser integration with Firefox
        ];
      };
    };
  };
}
