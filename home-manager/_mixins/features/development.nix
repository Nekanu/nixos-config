{ config, desktop, lib, pkgs, rootPath, ... }: {

  home.packages = with pkgs.unstable; [

    # Python
    python312Full
    python312Packages.pip

    # C#
    dotnet-sdk_8
    jetbrains.rider

    # Java
    jdk
    jetbrains.idea-ultimate

    # C++ / Qt / KDE
    jetbrains.clion
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

    # Postman
    postman

    # Cryptography Engineering
    pari
    openssl
  ];

  # Environment variables
  home.sessionVariables = {
    # PlantUML
    PLANTUML_JAR = "${pkgs.plantuml}/lib/plantuml.jar";
  };
}
