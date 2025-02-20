{ config, ... }:
{
  programs.plasma = {
    configFile."dolphinrc" = {
      DetailsMode = {
        ExpandableFolders.value = false;
        PreviewSize.value = 22;
        SidePadding.value = 0;
      };

      General = {
        GlobalViewProps.value = false;
        ShowSpaceInfo.value = false;
        ShowZoomSlider.value = false;
      };

      IconsMode = {
        PreviewSize.value = 80;
      };

      MainWindow = {
        MenuBar.value = false;
        ToolBarsMovable.value = false;
      };

      VersionControl = {
        enabledPlugins.value = "Git";
      };

      PreviewSettings = {
        Plugins.value = "audiothumbnail,blenderthumbnail,comicbookthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
      };

      "KFileDialog Settings"."Places Icons Auto-resize".value = false;
      "KFileDialog Settings"."Places Icons Static Size".value = 22;
    };

    configFile."kdeglobals" = {
      # File dialog settings
      "KFileDialog Settings" = {
        "View Style".value = "Detail";
        "Allow Expansion".value = false;
        "Automatically select filename extension".value = true;
        "Breadcrumb Navigation".value = true;
        "Decoration position".value = 2;
        "Sort directories first".value = true;
        "Sort hidden files last".value = false;
        "Sort by".value = "Name";
        "Sort reversed".value = false;
      };
    };
  };
}
