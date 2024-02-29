{ config, desktopEnvironments, lib, pkgs, rootPath, ... }: {
  # Lightly configuration
  programs.plasma = {
    configFile."lightlyrc" = {
      "Style"."DolphinSidebarOpacity" = 100;
    };

    configFile."kdeglobals" = {
      KDE = {
        widgetStyle = "Lightly";
      };
    };

    # Disable File Indexing
    configFile."baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
  };
}