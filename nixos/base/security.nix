{
  security = {
    #lockKernelModules = true;  # Locking kernel modules somehow disables IPv4
    protectKernelImage = true;

    apparmor.enable = true;

    auditd.enable = true;
    audit.enable = true;

    rtkit.enable = true;

    sudo = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
    };
  };
}
