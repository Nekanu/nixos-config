{
  programs.distrobox = {
    enable = true;
    enableSystemdUnit = false;
    containers = {
      ubuntu = {
        image = "ubuntu:latest";
        additional_packages = [ "git zoxide" ];
        init_hooks = [
          "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker"
          "ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker-compose"
        ];
      };
    };
  };
}
