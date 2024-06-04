{ config, ... }: 
{
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
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

          # Force correct theme for some GTK apps
          GTK_THEME = "Adwaita:dark";
        };
      };
    };
  }; 
}