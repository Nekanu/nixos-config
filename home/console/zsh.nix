{ ... }:
{
  programs.zsh = {
    enable = true;

    autocd = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    zsh-abbr = {
      enable = true;
      abbreviations = {
        mkhostid = "head -c4 /dev/urandom | od -A none -t x4";
        nix-hash-sha256 = "nix-hash --flat --base32 --type sha256";
        nix-gc = "sudo nix-collect-garbage --delete-older-than 14d";

        bhm = "build-home-manager";
        bn = "build-nixos";
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

      upgrade = "pushd $HOME/.config/nixos && nix flake update && popd && sudo nixos-rebuild switch --flake $HOME/.config/nixos && home-manager switch -b backup --flake $HOME/.config/nixos";

      build-home-manager = "home-manager switch -b backup --flake $HOME/.config/nixos";
      build-nixos = "sudo nixos-rebuild switch --flake $HOME/.config/nixos";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "aliases"
        "autojump"
        "colored-man-pages"
        "colorize"
        "command-not-found"
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
        "thefuck"
        "tldr"
        "zsh-interactive-cd"
      ];
    };
  };
}
