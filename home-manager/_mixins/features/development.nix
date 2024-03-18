{ config, desktop, lib, pkgs, rootPath, ... }: {

  home.packages = with pkgs.unstable; [
    # LaTeX
    texlive.combined.scheme-full

    # Node.js
    nodePackages.nodejs
    deno
    yarn

    # Python
    python3Full

    # Rust
    rustup

    # Java
    # jdk20
    # maven
    # gradle

    # C#
    dotnet-sdk_8

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

    # Jetbrains IDEs
    jetbrains-toolbox

    # Postman
    postman
    jmeter
  ];

  # Environment variables
  home.sessionVariables = {
    # PlantUML
    PLANTUML_JAR = "${pkgs.plantuml}/lib/plantuml.jar";
  };
}
