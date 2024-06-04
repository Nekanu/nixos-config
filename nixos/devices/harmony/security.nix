{ config, inputs, lib, pkgs, ... }:

{
  security = {

    # lockKernelModules = true;
    protectKernelImage = true;

    rtkit = {
      enable = true;
    };

    sudo = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
    };
  };

  users.groups = {
    "gaming" = {
      name = "gaming";
      gid = 8462;
    };
  };
}
