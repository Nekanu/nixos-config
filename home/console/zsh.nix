{ ... }:
let
  configDir = "$HOME/.config/nixos";
in
{
  programs.zsh = {
    enable = true;

    autocd = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    sessionVariables = {
      NIX_BUILD_SHELL = "zsh"; # Use ZSH also for nix-shells (but may break things)
    };

    zsh-abbr = {
      enable = true;
      abbreviations = {
        mkhostid = "head -c4 /dev/urandom | od -A none -t x4";
        nix-hash-sha256 = "nix-hash --flat --base32 --type sha256";
        nix-gc = "sudo nix-collect-garbage --delete-older-than 14d";

        bn = "build-nixos";
        bhm = "build-home-manager";
        u = "upgrade";
      };
    };

    shellAliases = {
      cat = "bat --paging=never";
      less = "bat --paging=always";
      more = "bat --paging=always";
      open = "xdg-open";
      pubip = "curl -s ifconfig.me/ip";
      tree = "exa --tree";

      build-nixos = "sudo nixos-rebuild switch --flake ${configDir}";
      build-home-manager = "home-manager switch -b backup --flake ${configDir}";
      upgrade = "nix flake update --flake ${configDir} && build-nixos && build-home-manager";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "aliases"
        "autojump"
        "colored-man-pages"
        "colorize"
        "common-aliases"
        "cp"
        "direnv"
        "dotenv"
        "eza"
        "fzf"
        "gh"
        "git"
        "helm"
        "kubectl"
        "opentofu"
        "pip"
        "podman"
        "starship"
        "systemd"
        "tldr"
        "zsh-interactive-cd"
      ];
    };
  };
}
