{config, ...}: {
  programs.plasma = {
    configFile."kwinrc" = {

      NightColor = {
        Active.value = true;
        LatituteFixed.value = 47.4;
        LongitudeFixed.value = 9.47;
        Mode.value = "Location";
      };

      Plugins = {
        "blurEnabled".value = true;
        "contrastEnabled".value = true;
      };

      # Use "Grid" layout for Task Switcher
      TabBox = {
        "LayoutName".value = "present_windows";
      };
    };

    configFile."kwinrulesrc" = {
      # Forces all Firefox Picture-in-Picture windows to be above all other windows
      "1" = {
        Description.value = "Picture-In-Picture";
        above.value = true;
        aboverule.value = 2;
        title.value = "Picture-in-Picture";
        titlematch.value = 1;
        types.value = 1;
        wmclass.value = "firefox";
        wmclassmatch.value = 1;
      };
    };
  };
}