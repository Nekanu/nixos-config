{ pkgs, ... }:
{
  imports = [
    ./atuin.nix
    ./bash.nix
    ./git.nix
    ./kitty.nix
    ./starship.nix
    ./xdg.nix
    ./vim
    ./zsh.nix
  ];

  home = {
    # A Modern Unix experience
    # https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/
    packages = with pkgs.unstable; [
      ffmpeg-headless # Terminal video encoder
      nixpkgs-review # Nix code review
      nodePackages.prettier # Code format
      rclone # Terminal cloud storage client
      shellcheck # Code lint Shell
      shfmt # Code format Shell
      puppet-bolt
    ];
  };

  programs = {
    autojump = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    bat = {
      enable = true;
      extraPackages = with pkgs.unstable.bat-extras; [
        batwatch
        prettybat
      ];
    };

    btop.enable = true;

    dircolors = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      nix-direnv.enable = true;
    };

    eza = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;

      icons = "auto";
      git = true;
    };

    fzf = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    gpg.enable = true;
    home-manager.enable = true;
    info.enable = true;
    jq.enable = true;

    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns-preview"
        "--colors=line:style:bold"
      ];
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      options = [ "--cmd cd" ]; # Replace cd with zoxide
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentry.package = pkgs.pinentry-qt;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
