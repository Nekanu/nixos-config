{ config, desktopEnvironments, additionalFeatures, hostname, inputs, lib, modulesPath, outputs, pkgs, stateVersion, username, ... }: {
  
  imports = [
    ./config.nix
    ./dolphin.nix
    ./file-associations.nix
    ./kwin.nix
    ./plasma5.nix
    ./shortcuts.nix
    ./spectacle.nix
  ];
}