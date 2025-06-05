{ pkgs, username, ... }:
{
  services.flatpak.packages = [
    "app.freelens.Freelens" # Kubernetes IDE
    "me.iepure.devtoolbox" # DevToolbox
  ];

  home.packages = with pkgs.unstable; [
    #jetbrains-toolbox
    jetbrains.rider

    minikube
    docker-machine-kvm2
  ];

  home.sessionPath = [
    "/home/${username}/.local/share/JetBrains/Toolbox/scripts/"

    # Dotnet SDK
    "/home/${username}/.dotnet"
    "/home/${username}/.dotnet/tools"
  ];
}
