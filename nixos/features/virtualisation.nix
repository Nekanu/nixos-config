{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    buildah
    podman-compose
    podman-tui
    podman-desktop
  ];

  ####### Docker #######

  # virtualisation.docker = {
  #   enable = true;
  #   enableOnBoot = true;
  # };

  # users.groups.docker.members = [ username ];

  ####### Podman #######

  virtualisation.podman = {
    enable = true;

    autoPrune.enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  users.groups.podman.members = [ username ];

  ####### Libvirt ########

  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };

  users.groups.libvirtd.members = [ username ];

  # Required for libvirtd
  programs.virt-manager.enable = true;

  ####### VirtualBox ########

  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;

  #boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
}
