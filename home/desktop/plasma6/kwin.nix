{ ... }:
{
  programs.plasma = {

    kwin = {
      titlebarButtons = {
        left = [ ];
        right = [
          "minimize"
          "maximize"
          "close"
        ];
      };

      effects = {
        shakeCursor.enable = true;
        translucency.enable = true;

        minimization = {
          animation = "squash";
          # duration = 50;
        };

        desktopSwitching.animation = "slide";

        blur.enable = true;
        dimInactive.enable = false;
        dimAdminMode.enable = true;
      };

      nightLight = {
        enable = true;
        mode = "location";
        location = {
          latitude = "50";
          longitude = "10";
        };
        temperature = {
          day = null; # No filter
          night = 4000;
        };
        transitionTime = 30;
      };

      virtualDesktops = {
        rows = 1;
        names = [
          "Generic"
          "Gaming"
          "Work"
        ];
      };
    };

    configFile."kwinrc" = {

      Plugins = {
        "contrastEnabled".value = true;
      };

      # Use "Grid" layout for Task Switcher
      TabBox = {
        "LayoutName".value = "present_windows";
      };
    };
  };
}
