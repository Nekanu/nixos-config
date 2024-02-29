{ pkgs, ... }: {
  imports = [
    ./fish.nix
    ./git.nix
    ./xdg.nix
  ];

  home = {
    # A Modern Unix experience
    # https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/
    packages = with pkgs.unstable; [
      ffmpeg-headless # Terminal video encoder
      nixpkgs-fmt # Code format Nix
      nixpkgs-review # Nix code review
      nodePackages.prettier # Code format
      rclone # Terminal cloud storage client
      shellcheck # Code lint Shell
      shfmt # Code format Shell
      puppet-bolt
      btop
    ];
  };

  programs = {
    atuin = {
      enable = true;
      package = pkgs.unstable.atuin;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.unstable.bat-extras; [
        batwatch
        prettybat
      ];
    };
    command-not-found.enable = true;
    dircolors = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      nix-direnv = {
        enable = true;
      };
    };
    eza = {
      enable = true;
      enableAliases = true;
      icons = true;
    };
    gpg.enable = true;
    home-manager.enable = true;
    info.enable = true;
    jq.enable = true;
    powerline-go = {
      enable = true;
      settings = {
        cwd-max-depth = 5;
        cwd-max-dir-size = 12;
        max-width = 60;
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "qt";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
