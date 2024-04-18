{ config, username, ... }: {
  programs.plasma = {
    
    shortcuts."services/org.kde.spectacle.desktop" = {
      CurrentMonitorScreenShot = "Print";
      FullScreenScreenShot = "Shift+Print";
      WindowUnderCursorScreenShot = "Meta+Shift+W";
      RectangularRegionScreenShot = "Meta+Shift+S";
    };

    configFile."spectaclerc" = {
      "General"."autoSaveImage".value = true;
      "General"."clipboardGroup".value = "PostScreenshotCopyImage";
      
      "Save"."defaultSaveLocation".value = "file:///home/${username}/Pictures/Screenshots";
    };
  };
}