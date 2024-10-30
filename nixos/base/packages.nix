{ hostname, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    binutils
    curl
    desktop-file-utils
    file
    gdb
    git
    home-manager
    killall
    man-pages
    nano
    pciutils
    rsync
    unzip
    usbutils
    v4l-utils
    wget
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    icu # for .NET
    nix-du
  ];

  programs = {
    dconf.enable = true;

    fish.enable = true;
  };

  # Allow mounting of drives without sudo
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
  };
}
