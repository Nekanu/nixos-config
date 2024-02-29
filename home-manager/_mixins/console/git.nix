{ pkgs, ... }: {
  programs = {
    gh = {
      enable = true;
      extensions = with pkgs.unstable; [ gh-markdown-preview ];
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    git = {
      enable = true;

      userName = "Joshua Nestler";
      userEmail = "developer.jn@mailbox.org";

      extraConfig = {
        commit.gpgsign = true;
        tag.gpgsign = true;
        gpg.format = "ssh";
        
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA6koXfskUzfuq79KJbI3AxDrmxR2K5YYwtl0HaRGYAx development@nekanu.com";
      };

      lfs = {
        enable = true;
      };

      difftastic = {
        enable = true;
      };
    };
  };
}
