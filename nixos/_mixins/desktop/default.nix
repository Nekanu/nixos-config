{ inputs, desktopEnvironments, lib, pkgs, ... }: {
  imports = [
    ../base/pipewire.nix
    ../features/appimage.nix
    ../features/printing.nix
    ../features/multimedia.nix
    ../features/productivity.nix
    ../features/communication.nix
    ../features/obs.nix
    ../features/sane.nix
    ../features/yubico.nix
    ../../../modules/pcloud.nix
  ]
  # Include all desktop environments specified in the `desktopEnvironments` list.
  ++ (map (element: (./. + "/${element}")) desktopEnvironments);

  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "DroidSansMono" ]; })

      # Microsoft fonts
      corefonts
      vistafonts
      cascadia-code
    ];
  };

  boot.kernelParams = [ "quiet" ];
  boot.plymouth.enable = true;

  environment.systemPackages = with pkgs; [
    pcloud
    # inputs.nix-software-center.packages.${system}.nix-software-center
    timeshift
    gparted

    firefox
  ];

  # programs.ssh.askPassword = lib.mkForce "${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass";
}
