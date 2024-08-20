{ config, pkgs, ... }: {
  programs.plasma = {
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
  };
}