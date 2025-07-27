{ pkgs, username, ... }:
{
  imports = [
    ../modules/dotnet.nix
  ];

  services.flatpak.packages = [
    "app.freelens.Freelens" # Kubernetes IDE
    "me.iepure.devtoolbox" # DevToolbox
  ];

  home.packages = with pkgs; [
    #jetbrains-toolbox
    master.jetbrains.rider

    minikube
    docker-machine-kvm2

    kubectl
    kubernetes-helm

    nil
  ];

  home.sessionPath = [
    "/home/${username}/.local/share/JetBrains/Toolbox/scripts/"

    # Dotnet SDK
    #"/home/${username}/.dotnet"
    #"/home/${username}/.dotnet/tools"
  ];
}
