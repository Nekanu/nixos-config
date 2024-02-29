{ pkgs, ... }: {
  services.flatpak.packages = [
    "com.brave.Browser"
    "org.mozilla.Thunderbird"
    "com.ulduzsoft.Birdtray"
    "org.remmina.Remmina"
    "org.keepassxc.KeePassXC"
    "com.usebottles.bottles"
    "com.logseq.Logseq"
  ];
}
