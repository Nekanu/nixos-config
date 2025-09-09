{ pkgs, ... }:
{
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      khelpcenter
      kate
      discover
    ];

    systemPackages = with pkgs.kdePackages; [
      filelight
      ksshaskpass
      plasma-browser-integration
      krfb # VNC server for KDEconnect
      sddm-kcm
      plymouth-kcm
    ];
  };

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
  };

  services = {
    flatpak.enable = true;

    displayManager = {
      defaultSession = "plasma";

      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
        enableQt5Integration = true;
      };
    };
  };
}
