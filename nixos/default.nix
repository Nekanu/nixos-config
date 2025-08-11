{
  config,
  defaultOverlays,
  desktopEnvironments,
  additionalFeatures,
  hostname,
  inputs,
  lib,
  modulesPath,
  pkgs,
  stateVersion,
  username,
  ...
}:
{
  imports = [
    (./. + "/devices/${hostname}")
    (modulesPath + "/installer/scan/not-detected.nix")
    ./base
    ./users
    ./console
    ./modules
  ]
  ++ lib.optional (desktopEnvironments != [ ]) ./desktop
  ++ (map (feature: (./. + "/features/${feature}.nix")) additionalFeatures);

  nixpkgs = {
    config.allowUnfree = true;
    overlays = defaultOverlays;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Apply 15 minute timeout to home-manager service (Installing flatpaks can take a while)
  systemd.services."home-manager-${username}".serviceConfig.TimeoutStartSec = pkgs.lib.mkForce 900;

  system.stateVersion = stateVersion;
}
