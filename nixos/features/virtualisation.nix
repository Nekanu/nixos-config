{ config, hostname, lib, pkgs, ... }: {
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    buildah
    podman-compose
    podman-tui
    podman-desktop

    # docker-compose

    distrobox
  ];

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };

    # podman = {
    #   enable = true;

    #   dockerCompat = true;
    #   dockerSocket.enable = true;
    #   defaultNetwork.settings.dns_enabled = true;
    # };

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
