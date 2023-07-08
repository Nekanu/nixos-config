{ hostname, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    binutils
    curl
    desktop-file-utils
    file
    git
    home-manager
    killall
    man-pages
    mergerfs
    mergerfs-tools
    nano
    pciutils
    rsync
    unzip
    usbutils
    v4l-utils
    wget
    xdg-utils
    icu # for .NET
  ];

  programs = {
    dconf.enable = true;

    fish.enable = true;
  };
}
