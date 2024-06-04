{ config, desktopEnvironments, additionalFeatures, hostname, inputs, lib, modulesPath, outputs, pkgs, stateVersion, username, ... }: {
  
  imports = [
    ./config.nix
    ./dolphin.nix
    ./file-associations.nix
    ./konsole.nix
    ./kwin.nix
    ./plasma6.nix
    ./shortcuts.nix
    ./spectacle.nix
  ];
}