{ config, config-repository, ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    flake = config-repository;
    persistent = true;
  };
}
