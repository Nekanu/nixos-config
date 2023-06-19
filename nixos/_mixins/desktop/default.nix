{ inputs, desktop, pkgs, ... }: {
  imports = [
    ../services/cups.nix
    ../services/flatpak.nix
    ../services/sane.nix
    ../services/yubico.nix
    ../../../modules/pcloud.nix
    (./. + "/${desktop}.nix")
  ];

  # boot.kernelParams = [ "quiet" ];
  # boot.plymouth.enable = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      cascadia-code
    ];
  };

  environment.systemPackages = with pkgs; [
    pcloud
    inputs.nix-software-center.packages.${system}.nix-software-center
  ];
}
