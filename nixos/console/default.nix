{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./nano.nix
    ./zsh.nix
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };

    command-not-found.enable = false; # Explicitly disable command-not-found to use nix-index instead (it was enabled whyever)

    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    fzf.fuzzyCompletion = true;
  };

  environment.systemPackages = [
    pkgs.tldr # Simplified Man Pages
  ];
}
