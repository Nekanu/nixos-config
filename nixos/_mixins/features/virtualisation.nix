{ config, hostname, lib, pkgs, ... }: {
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    buildah
    podman-compose
    podman-tui
    podman-desktop

    docker-compose

    distrobox
  ];

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };

    podman = {
      # defaultNetwork.settings.dns_enabled = true;
      # dockerSocket.enable = true;
      # dockerCompat = true;
      # enable = true;
    };

    libvirtd = {
      enable = true;
    };

    # virtualbox.host = {
    #   enable = true;
    #   enableExtensionPack = true;
    # };

    waydroid = {
      enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Required for libvirtd
  programs.virt-manager.enable = true;
}
