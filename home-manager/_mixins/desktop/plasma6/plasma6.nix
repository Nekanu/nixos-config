{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    kwin.titlebarButtons = {
      left = [ "more-window-actions" ];
      right = [ "minimize" "maximize" "close" ];
    };

    workspace = {
      clickItemTo = "select";
    };

    # Enable NumLock on startup
    configFile."kcminputrc".Keyboard.NumLock.value = 0;
  };

}
