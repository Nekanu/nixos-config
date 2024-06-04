{ config, username, ... }: {
  programs.plasma = {
    
    spectacle.shortcuts = {
      launch = "Meta+S";

      captureCurrentMonitor = "Print";
      captureEntireDesktop = "Shift+Print";
      captureWindowUnderCursor = "Meta+Shift+W";
      captureRectangularRegion = "Meta+Shift+S";
      captureActiveWindow = "Meta+Shift+A";
    };

    # shortcuts."services/org.kde.spectacle.desktop" = {
    #   CurrentMonitorScreenShot = "Print";
    #   FullScreenScreenShot = "Shift+Print";
    #   WindowUnderCursorScreenShot = "Meta+Shift+W";
    #   RectangularRegionScreenShot = "Meta+Shift+S";
    # };

    configFile."spectaclerc" = {
      "General"."autoSaveImage".value = true;
      "General"."clipboardGroup".value = "PostScreenshotCopyImage";
      
      "Save"."defaultSaveLocation".value = "file:///home/${username}/Pictures/Screenshots";
    };
  };
}