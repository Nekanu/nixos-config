{ config, desktopEnvironments, lib, pkgs, rootPath, ... }: {
  # Lightly configuration
  programs.plasma = {
    configFile."lightlyrc" = {
      "Style"."DolphinSidebarOpacity".value = 100;
    };

    configFile."kdeglobals" = {
      KDE = {
        widgetStyle.value = "Lightly";
      };
    };

    # Disable File Indexing
    configFile."baloofilerc"."Basic Settings"."Indexing-Enabled".value = false;
  };
}