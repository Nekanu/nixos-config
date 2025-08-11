{ pkgs, username, ... }:
{
  imports = [
    ../modules/dotnet.nix
  ];

  services.flatpak.packages = [
    "app.freelens.Freelens" # Kubernetes IDE
    "me.iepure.devtoolbox" # DevToolbox
  ];

  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.jetbrains-toolbox}/share/applications/jetbrains-toolbox.desktop"
    ];
  };

  home.packages = with pkgs; [
    master.jetbrains-toolbox

    minikube
    docker-machine-kvm2

    kubectl
    kubernetes-helm

    nil

    clang
  ];

  home.sessionPath = [
    "/home/${username}/.local/share/JetBrains/Toolbox/scripts/"

    # Dotnet SDK
    "/home/${username}/.dotnet"
    "/home/${username}/.dotnet/tools"
  ];
}
