{ pkgs, ... }: {
  services.flatpak.packages = [
    "rest.insomnia.Insomnia"
  ];
}

