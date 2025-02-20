{
  config,
  desktop,
  lib,
  pkgs,
  rootPath,
  username,
  hostname,
  ...
}:
{
  services.flatpak.packages = [ "app.freelens.Freelens" ];

  home.packages = with pkgs.unstable; [

    jetbrains-toolbox

    # LaTeX
    texliveFull

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
    nixfmt-rfc-style

    # Foundry VTT
    nodejs_20
    yarn
  ];

  # Environment variables
  home.sessionVariables = {
    # PlantUML
    PLANTUML_JAR = "${pkgs.plantuml}/lib/plantuml.jar";
  };

  home.sessionPath = [
    "/home/${username}/.local/share/JetBrains/Toolbox/scripts/"

    # Dotnet SDK
    "/home/${username}/.dotnet"
    "/home/${username}/.dotnet/tools"
  ];
}
