{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  console = {
    enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      # powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };

    graphics = {
      enable = true;
    };

    # TUXEDO Laptop
    tuxedo-drivers.enable = true;
    tuxedo-rs = {
      enable = true;
      tailor-gui.enable = true;
    };
  };

  # Power Management

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    fwupd.enable = true;
    thermald.enable = true;
    #tlp.enable = true;
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
