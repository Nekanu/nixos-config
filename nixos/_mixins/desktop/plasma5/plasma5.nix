{ inputs, pkgs, ... }: {
  
  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      oxygen
      khelpcenter
    ];

    systemPackages = with pkgs; [
      libsForQt5.lightly
      libsForQt5.filelight
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.ksshaskpass
      libsForQt5.plasma-browser-integration
      libsForQt5.krfb # VNC server for KDEconnect

      layan-kde
      layan-gtk-theme
      sddm-kcm

      plasma5-wallpapers-dynamic
    ];
  };

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
  };

  services = {
    flatpak.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        defaultSession = "plasmawayland";

        sddm = {
          enable = true;
          autoNumlock = true;
        };
      };

      desktopManager = {
        plasma5 = {
          enable = true;
          notoPackage = pkgs.noto-fonts;
          phononBackend = "vlc";
          runUsingSystemd = true;
          useQtScaling = true;
        };
      };
    };
  };
}
