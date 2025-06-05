{...}: {
  programs.distrobox = {
    enable = true;
    enableSystemdUnit = false;
    containers = {
      ubuntu = {
        image = "ubuntu:latest"
      };

      arch = {
        image = "archlinux:latest";
      };
    };
  };
}