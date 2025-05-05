{ ... }:
{
  security = {
    #lockKernelModules = true; # Locking kernel modules somehow disables IPv4
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
