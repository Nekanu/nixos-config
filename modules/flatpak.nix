{
  config,
  pkgs,
  lib,
  ...
}:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = lib.mkOptionDefault "*";
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  # Configure Flatpak
  services.flatpak = {
    enable = true;

    uninstallUnmanaged = true;

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

    update.auto = {
      enable = true;
      onCalendar = "daily";
    };

    overrides = {
      global = {
        Environment = {
          # Fix unthemed cursor in Flatpak apps
          XCURSOR_PATH = "/run/current-system/sw/share/icons:~/.nix-profile/share/icons/";

          # Force correct theme for some GTK apps
          GTK_THEME = "Breeze:dark";
        };
      };
    };
  };
}
