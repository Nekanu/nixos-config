{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gnome
  ];

  programs = {
    dconf.enable = true;
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
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

  xdg = {
    portal = {
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
