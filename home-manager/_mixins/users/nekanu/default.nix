{ pkgs, username, ... }: {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        # nativeMessagingHosts = with pkgs.nur.repos.wolfangaukang; [ vdhcoapp ];
      };
    };
  };
}
