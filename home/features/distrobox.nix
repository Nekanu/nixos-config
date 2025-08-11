{
  programs.distrobox = {
    enable = true;
    enableSystemdUnit = false;
    # containers = {
    #   ubuntu = {
    #     image = "ubuntu:latest";
    #     entry = true;
    #     init_hooks = [
    #       "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker"
    #       "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker-compose"
    #     ];
    #   };

    #   arch = {
    #     image = "archlinux:latest";
    #     entry = true;
    #     init_hooks = [
    #       "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker"
    #       "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker-compose"
    #     ];
    #   };
    # };
  };
}
