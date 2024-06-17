{ config, desktop, lib, pkgs, rootPath, ... }: {

  home.packages = with pkgs.unstable; [

    jetbrains-toolbox

    # LaTeX
    texliveMedium

    # Python
    python312Full
    python312Packages.pip

    # C#
    dotnet-sdk_8

    # Java
    jdk
    jmeter

    # C++ / Qt / KDE
    qt6.full
    cmake
    gcc
    kdePackages.extra-cmake-modules

    # HashiCorp toolchain
    vagrant # Virtual machines
    terraform # Infrastructure as code
    terraform-ls
    terraform-lsp
    terraform-docs
    terraform-compliance
    terraform-inventory
    nomad
    nomad-autoscaler
    nomad-pack
    consul
    vault
    packer

    # Ansible
    ansible
    ansible-lint
    ansible-doctor

    # Designing
    plantuml

    # NixOS development
    nixos-generators
    nixf
    nixel
    nixci
    nix-diff
    nix-health
    nixpkgs-fmt
    nix-index
  ];

  # Environment variables
  home.sessionVariables = {
    # PlantUML
    PLANTUML_JAR = "${pkgs.plantuml}/lib/plantuml.jar";
  };

  services.flatpak.packages = [
    "com.getpostman.Postman"
  ];
}
