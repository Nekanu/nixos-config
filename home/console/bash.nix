{ config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;

    historyFile = "${config.home.homeDirectory}/.local/share/bash/history";

    shellAliases = {
      cat = "bat --paging=never";
      # diff = "diffr";
      less = "bat --paging=always";
      more = "bat --paging=always";
      open = "xdg-open";
      pubip = "curl -s ifconfig.me/ip";
      top = "btop";
      tree = "exa --tree";
    };
  };
}
