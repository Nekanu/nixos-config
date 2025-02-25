{ ... }:
{
  services.pcscd.enable = true;

  services.flatpak.packages = [
    "com.yubico.yubioath"
  ];
}
