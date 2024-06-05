{ config, desktop, lib, pkgs, rootPath, ... }: {

  home.packages = with pkgs.unstable; [

    jetbrains-toolbox

    # Python
    python312Full
    python312Packages.pip

    # C#
    dotnet-sdk_8

    # Java
    jdk

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

    # Cryptography Engineering
    pari
    openssl

    # NixOS development
    nixos-generators
  ];

  # Environment variables
  home.sessionVariables = {
    # PlantUML
    PLANTUML_JAR = "${pkgs.plantuml}/lib/plantuml.jar";
  };

  services.flatpak.packages = [
    "rest.insomnia.Insomnia"
    "com.getpostman.Postman"
  ];
}
