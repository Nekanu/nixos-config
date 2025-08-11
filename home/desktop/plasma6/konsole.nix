{
  programs.plasma = {
    configFile."konsolerc" = {
      "Desktop Entry"."DefaultProfile".value = "Default.profile";
    };

    dataFile."konsole/Default.colorscheme" = {
      Background.Color.value = "35,38,39";
      BackgroundFaint.Color.value = "49,54,59";
      BackgroundIntense.Color.value = "0,0,0";

      Color0.Color.value = "35,38,39";
      Color0Faint.Color.value = "49,54,59";
      Color0Intense.Color.value = "127,140,141";

      Color1.Color.value = "237,21,21";
      Color1Faint.Color.value = "120,50,40";
      Color1Intense.Color.value = "192,57,43";

      Color2.Color.value = "17,209,22";
      Color2Faint.Color.value = "23,162,98";
      Color2Intense.Color.value = "28,220,154";

      Color3.Color.value = "246,116,0";
      Color3Faint.Color.value = "182,86,25";
      Color3Intense.Color.value = "253,188,75";

      Color4.Color.value = "29,153,243";
      Color4Faint.Color.value = "27,102,143";
      Color4Intense.Color.value = "61,174,233";

      Color5.Color.value = "155,89,182";
      Color5Faint.Color.value = "97,74,115";
      Color5Intense.Color.value = "142,68,173";

      Color6.Color.value = "26,188,156";
      Color6Faint.Color.value = "24,108,96";
      Color6Intense.Color.value = "22,160,133";

      Color7.Color.value = "252,252,252";
      Color7Faint.Color.value = "99,104,109";
      Color7Intense.Color.value = "255,255,255";

      Foreground.Color.value = "252,252,252";
      ForegroundFaint.Color.value = "239,240,241";
      ForegroundIntense.Color.value = "61,174,233";

      General = {
        Anchor.value = "0.5,0.5";
        Blur.value = "true";
        ColorRandomization.value = "false";
        Description.value = "Default";
        FillStyle.value = "Tile";
        Opacity.value = "0.8";
        Wallpaper.value = "";
        WallpaperFlipType.value = "NoFlip";
        WallpaperOpacity.value = "1";
      };
    };

    dataFile."konsole/Default.profile" = {
      Appearance = {
        ColorScheme.value = "Default";
        Font.value = "CaskaydiaCove Nerd Font,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      };

      CursorOptions = {
        CursorShape.value = "1";
      };

      General = {
        Name.value = "Default";
        Parent.value = "FALLBACK/";
      };

      Scrolling = {
        HistoryMode.value = 2;
      };
    };
  };
}
