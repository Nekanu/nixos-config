{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    kwin.titlebarButtons = {
      left = [  ];
      right = [ "minimize" "maximize" "close" ];
    };

    workspace = {
      clickItemTo = "select";
    };

    powerdevil.AC = {
      powerButtonAction = "sleep";
      autoSuspend = {
        action = "nothing";
        # idleTimeout = 900;
      };
      turnOffDisplay = {
        idleTimeout = "never";
        # idleTimeoutWhenLocked = "immediately";
      };

      whenLaptopLidClosed = "sleep";
    };

    powerdevil.battery = {
      powerButtonAction = "sleep";
      autoSuspend = {
        action = null; # Sleep
        idleTimeout = 900;
      };
      turnOffDisplay = {
        idleTimeout = 900;
        idleTimeoutWhenLocked = "immediately";
      };

      whenLaptopLidClosed = "sleep";
    };

    # Enable NumLock on startup
    configFile."kcminputrc".Keyboard.NumLock.value = 0;
  };

  home.packages = with pkgs; [
    xdg-desktop-portal-kde
  ];
}
