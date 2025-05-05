{ pkgs, ... }:
{
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

      userName = "Nekanu";
      userEmail = "development@nekanu.com";

      extraConfig = {
        core.autocrlf = "input";
        commit.gpgsign = true;
        tag.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.defaultKeyCommand = "ssh-add -L";
        user.defaultBranch = "main";
      };

      lfs.enable = true;
      difftastic.enable = true;
    };
  };
}
