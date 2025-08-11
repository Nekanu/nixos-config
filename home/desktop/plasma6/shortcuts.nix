{
  programs.plasma = {
    shortcuts = {
      # Add a shortcut to launch the system monitor
      "org.kde.plasma-systemmonitor.desktop"."_launch" = "Ctrl+Shift+Esc";

      # Add a shortcut to launch the terminal
      "org.kde.konsole.desktop"."_launch" = "Ctrl+Alt+T";

      # Add a shortcut to launch the file manager
      "org.kde.dolphin.desktop"."_launch" = "Meta+E";

      # Add a shortcut to launch the System Settings
      "systemsettings.desktop"."_launch" = "Meta+I";
    };
  };
}
