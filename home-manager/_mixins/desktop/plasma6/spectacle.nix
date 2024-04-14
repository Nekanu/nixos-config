{ config, username, ... }: {
  programs.plasma = {
    
    spectacle.shortcuts = {
      "captureRectangularRegion" = "Meta+Shift+S";
    };

    configFile."spectaclerc" = {
      "General"."autoSaveImage".value = true;
      "General"."clipboardGroup".value = "PostScreenshotCopyImage";
      
      "Save"."defaultSaveLocation".value = "file:///home/${username}/Pictures/Screenshots";
    };
  };
}