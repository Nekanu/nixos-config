{ pkgs, username, ... }:
{
  services.flatpak.packages = [
    "app.freelens.Freelens" # Kubernetes IDE
  ];

  home.packages = with pkgs.unstable; [
    jetbrains-toolbox
  ];

  home.sessionPath = [
    "/home/${username}/.local/share/JetBrains/Toolbox/scripts/"

    # Dotnet SDK
    "/home/${username}/.dotnet"
    "/home/${username}/.dotnet/tools"
  ];
}
