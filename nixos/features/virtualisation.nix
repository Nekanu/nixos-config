{
  config,
  hostname,
  lib,
  pkgs,
  ...
}:
{
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    buildah
    podman-compose
    podman-tui
    podman-desktop

    distrobox
    distrobox-tui
  ];

  virtualisation = {
    # docker = {
    #   enable = true;
    #   enableOnBoot = true;
    # };

    podman = {
      enable = true;

      autoPrune.enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd = {
      enable = true;
    };

    waydroid = {
      enable = true;
    };
  };

  # Required for libvirtd
  programs.virt-manager.enable = true;
}
