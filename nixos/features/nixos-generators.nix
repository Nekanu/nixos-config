{ inputs, config, modulesPath, ... }: {
  imports = [
    inputs.nixos-generators.nixosModules.all-formats
  ];

  formatConfigs.gui-installer = { config, modulesPath, ... }: {
    imports = [
      "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
    ];

    formatAttr = "isoImage";
    fileExtension = ".iso";
  };
}