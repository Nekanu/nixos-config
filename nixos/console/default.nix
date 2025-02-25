{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./nano.nix
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };

    command-not-found.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    fzf.fuzzyCompletion = true;
  };
}
