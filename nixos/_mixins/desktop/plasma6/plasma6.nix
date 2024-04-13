{ input, pkgs, ... }: {

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      khelpcenter
      kate
    ];

    systemPackages = with pkgs; [
      # kdePackages.lightly
      kdePackages.filelight
      kdePackages.qtstyleplugin-kvantum
      kdePackages.ksshaskpass
      kdePackages.plasma-browser-integration
      kdePackages.krfb # VNC server for KDEconnect
      kdePackages.sddm-kcm

      # plasma5-wallpapers-dynamic
    ];
  };

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
  };

  services = {
    flatpak.enable = true;

    # xserver = {
    #   enable = true;
    # };

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

  i18n.inputMethod.fcitx5.plasma6Support = true;
}
