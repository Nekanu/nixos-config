{config, ...}: {
  programs.plasma = {
    configFile."kwinrc" = {

      NightColor = {
        Active = true;
        LatituteFixed = 47.4;
        LongitudeFixed = 9.47;
        Mode = "Location";
      };

      Plugins = {
        "blurEnabled" = true;
        "contrastEnabled" = true;
      };

      # Use "Grid" layout for Task Switcher
      TabBox = {
        "LayoutName" = "present_windows";
      };
    };

    configFile."kwinrulesrc" = {
      # Forces all Firefox Picture-in-Picture windows to be above all other windows
      "1" = {
        Description = "Picture-In-Picture";
        above = true;
        aboverule = 2;
        title = "Picture-in-Picture";
        titlematch = 1;
        types = 1;
        wmclass = "firefox";
        wmclassmatch = 1;
      };
    };
  };
}