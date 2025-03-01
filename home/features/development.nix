{ pkgs, username, ... }:
{
  services.flatpak.packages = [
    "app.freelens.Freelens" # Kubernetes IDE
  ];

  home.packages = with pkgs.unstable; [

    jetbrains-toolbox

    # Python
    python312Full
    python312Packages.pip

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

    # Kubernetes
    kubectl
    kubernetes-helm
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
