{ inputs, desktopEnvironments, lib, pkgs, ... }: {
  imports = [
    ../base/pipewire.nix
    ./modules/appimage.nix
    ./modules/printing.nix
    ./modules/sane.nix
    ./modules/obs.nix
    ./modules/yubico.nix
    ../../modules/flatpak.nix
    ../../modules/pcloud.nix
  ]
  # Include all desktop environments specified in the `desktopEnvironments` list.
  ++ (map (element: (./. + "/${element}")) desktopEnvironments);

  boot.kernelParams = [ "quiet" ];
  boot.plymouth.enable = true;

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    pcloud
    gparted

    xwaylandvideobridge
  ];

  # programs.ssh.askPassword = lib.mkForce "${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass";
}
