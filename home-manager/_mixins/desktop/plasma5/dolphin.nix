{config, ...}: {
  programs.plasma = {
    configFile."dolphinrc" = {
      DetailsMode = {
        ExpandableFolders = false;
        PreviewSize = 22;
        SidePadding = 0;
      };

      General = {
        GlobalViewProps = false;
        ShowSpaceInfo = false;
        ShowZoomSlider = false;
      };

      IconsMode = {
        PreviewSize = 80;
      };

      MainWindow = {
        MenuBar = false;
        ToolBarsMovable = false;
      };

      VersionControl = {
        enabledPlugins = "Git";
      };

      PreviewSettings = {
        Plugins = "audiothumbnail,blenderthumbnail,comicbookthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
      };
      
      "KFileDialog Settings"."Places Icons Auto-resize" = false;
      "KFileDialog Settings"."Places Icons Static Size" = 22;  
    };

    configFile."kdeglobals" = {
      # File dialog settings
      "KFileDialog Settings" = {
        "View Style" = "Detail";
        "Allow Expansion" = false;
        "Automatically select filename extension" = true;
        "Breadcrumb Navigation" = true;
        "Decoration position" = 2;
        "Sort directories first" = true;
        "Sort hidden files last" = false;
        "Sort by" = "Name";
        "Sort reversed" = false;
      };
    };
  };
}