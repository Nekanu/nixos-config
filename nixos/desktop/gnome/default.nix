{ inputs, pkgs, ... }: {
  environment = {

    systemPackages = with pkgs; [
      xdg-desktop-portal-gnome
    ];
  };

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    dconf.enable = true;
  };

  services = {
    flatpak.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          autoNumlock = true;
        };
      };

      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };
}
