{ config, config-repository, pkgs, ...}: {
  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    flake = config-repository;
    persistent = true;
  };
}