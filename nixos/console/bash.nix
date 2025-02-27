{ ... }:
{
  programs.bash = {
    blesh.enable = true;
    completion.enable = true;
    vteIntegration = true;

    shellAliases = {
      cat = "bat --paging=never";
      less = "bat --paging=always";
      more = "bat --paging=always";
    };
  };
}
