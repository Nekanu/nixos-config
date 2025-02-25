{ pkgs, ... }:
{
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      khelpcenter
      kate
      discover
    ];

    systemPackages = with pkgs; [
      kdePackages.filelight
      kdePackages.qtstyleplugin-kvantum
      kdePackages.ksshaskpass
      kdePackages.plasma-browser-integration
      kdePackages.krfb # VNC server for KDEconnect
      kdePackages.sddm-kcm
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

  xdg = {
    portal = {
      config.common.default = "kde";
      configPackages = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
      extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    };
  };

  i18n.inputMethod.fcitx5.plasma6Support = true;
}
